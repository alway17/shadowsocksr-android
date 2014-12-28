# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
LOCAL_PATH := $(call my-dir)
ROOT_PATH := $(LOCAL_PATH)

########################################################
## libsodium
########################################################

include $(CLEAR_VARS)

crypto_aead_src := crypto_aead/chacha20poly1305/sodium/aead_chacha20poly1305.c

crypto_auth_src := crypto_auth/crypto_auth.c crypto_auth/hmacsha256/auth_hmacsha256_api.c crypto_auth/hmacsha256/cp/hmac_hmacsha256.c crypto_auth/hmacsha256/cp/verify_hmacsha256.c crypto_auth/hmacsha512/auth_hmacsha512_api.c crypto_auth/hmacsha512/cp/hmac_hmacsha512.c crypto_auth/hmacsha512/cp/verify_hmacsha512.c crypto_auth/hmacsha512256/auth_hmacsha512256_api.c crypto_auth/hmacsha512256/cp/hmac_hmacsha512256.c crypto_auth/hmacsha512256/cp/verify_hmacsha512256.c 

crypto_box_src := crypto_box/crypto_box.c crypto_box/crypto_box_easy.c crypto_box/curve25519xsalsa20poly1305/box_curve25519xsalsa20poly1305_api.c crypto_box/curve25519xsalsa20poly1305/ref/after_curve25519xsalsa20poly1305.c crypto_box/curve25519xsalsa20poly1305/ref/before_curve25519xsalsa20poly1305.c crypto_box/curve25519xsalsa20poly1305/ref/box_curve25519xsalsa20poly1305.c crypto_box/curve25519xsalsa20poly1305/ref/keypair_curve25519xsalsa20poly1305.c 

crypto_core_src := crypto_core/hsalsa20/core_hsalsa20_api.c crypto_core/hsalsa20/ref2/core_hsalsa20.c crypto_core/salsa20/core_salsa20_api.c crypto_core/salsa20/ref/core_salsa20.c crypto_core/salsa2012/core_salsa2012_api.c crypto_core/salsa2012/ref/core_salsa2012.c crypto_core/salsa208/core_salsa208_api.c crypto_core/salsa208/ref/core_salsa208.c 

crypto_generichash_src := crypto_generichash/blake2/generichash_blake2_api.c crypto_generichash/blake2/ref/blake2b-ref.c crypto_generichash/blake2/ref/generichash_blake2b.c crypto_generichash/crypto_generichash.c

crypto_hash_src := crypto_hash/crypto_hash.c crypto_hash/sha256/cp/hash_sha256.c crypto_hash/sha256/hash_sha256_api.c crypto_hash/sha512/cp/hash_sha512.c crypto_hash/sha512/hash_sha512_api.c

crypto_onetimeauth_src := crypto_onetimeauth/crypto_onetimeauth.c crypto_onetimeauth/poly1305/donna/auth_poly1305_donna.c crypto_onetimeauth/poly1305/donna/verify_poly1305_donna.c crypto_onetimeauth/poly1305/onetimeauth_poly1305.c crypto_onetimeauth/poly1305/onetimeauth_poly1305_api.c crypto_onetimeauth/poly1305/onetimeauth_poly1305_try.c

crypto_pwhash_src := crypto_pwhash/scryptsalsa208sha256/crypto_scrypt-common.c crypto_pwhash/scryptsalsa208sha256/nosse/pwhash_scryptsalsa208sha256_nosse.c crypto_pwhash/scryptsalsa208sha256/pbkdf2-sha256.c crypto_pwhash/scryptsalsa208sha256/pwhash_scryptsalsa208sha256.c crypto_pwhash/scryptsalsa208sha256/scrypt_platform.c

crypto_scalarmult_src := crypto_scalarmult/crypto_scalarmult.c crypto_scalarmult/curve25519/donna_c64/base_curve25519_donna_c64.c crypto_scalarmult/curve25519/donna_c64/smult_curve25519_donna_c64.c crypto_scalarmult/curve25519/ref10/base_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_0_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_1_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_add_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_copy_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_cswap_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_frombytes_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_invert_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_mul121666_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_mul_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_sq_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_sub_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/fe_tobytes_curve25519_ref10.c crypto_scalarmult/curve25519/ref10/scalarmult_curve25519_ref10.c crypto_scalarmult/curve25519/scalarmult_curve25519_api.c

crypto_secretbox_src := crypto_secretbox/crypto_secretbox.c crypto_secretbox/crypto_secretbox_easy.c crypto_secretbox/xsalsa20poly1305/ref/box_xsalsa20poly1305.c crypto_secretbox/xsalsa20poly1305/secretbox_xsalsa20poly1305_api.c 

crypto_shorthash_src := crypto_shorthash/crypto_shorthash.c crypto_shorthash/siphash24/ref/shorthash_siphash24.c crypto_shorthash/siphash24/shorthash_siphash24_api.c

crypto_sign_src := crypto_sign/crypto_sign.c crypto_sign/ed25519/ref10/fe_0.c crypto_sign/ed25519/ref10/fe_1.c crypto_sign/ed25519/ref10/fe_add.c crypto_sign/ed25519/ref10/fe_cmov.c crypto_sign/ed25519/ref10/fe_copy.c crypto_sign/ed25519/ref10/fe_frombytes.c crypto_sign/ed25519/ref10/fe_invert.c crypto_sign/ed25519/ref10/fe_isnegative.c crypto_sign/ed25519/ref10/fe_isnonzero.c crypto_sign/ed25519/ref10/fe_mul.c crypto_sign/ed25519/ref10/fe_neg.c crypto_sign/ed25519/ref10/fe_pow22523.c crypto_sign/ed25519/ref10/fe_sq.c crypto_sign/ed25519/ref10/fe_sq2.c crypto_sign/ed25519/ref10/fe_sub.c crypto_sign/ed25519/ref10/fe_tobytes.c crypto_sign/ed25519/ref10/ge_add.c crypto_sign/ed25519/ref10/ge_double_scalarmult.c crypto_sign/ed25519/ref10/ge_frombytes.c crypto_sign/ed25519/ref10/ge_madd.c crypto_sign/ed25519/ref10/ge_msub.c crypto_sign/ed25519/ref10/ge_p1p1_to_p2.c crypto_sign/ed25519/ref10/ge_p1p1_to_p3.c crypto_sign/ed25519/ref10/ge_p2_0.c crypto_sign/ed25519/ref10/ge_p2_dbl.c crypto_sign/ed25519/ref10/ge_p3_0.c crypto_sign/ed25519/ref10/ge_p3_dbl.c crypto_sign/ed25519/ref10/ge_p3_to_cached.c crypto_sign/ed25519/ref10/ge_p3_to_p2.c crypto_sign/ed25519/ref10/ge_p3_tobytes.c crypto_sign/ed25519/ref10/ge_precomp_0.c crypto_sign/ed25519/ref10/ge_scalarmult_base.c crypto_sign/ed25519/ref10/ge_sub.c crypto_sign/ed25519/ref10/ge_tobytes.c crypto_sign/ed25519/ref10/keypair.c crypto_sign/ed25519/ref10/open.c crypto_sign/ed25519/ref10/sc_muladd.c crypto_sign/ed25519/ref10/sc_reduce.c crypto_sign/ed25519/ref10/sign.c crypto_sign/ed25519/sign_ed25519_api.c crypto_sign/edwards25519sha512batch/ref/fe25519_edwards25519sha512batch.c crypto_sign/edwards25519sha512batch/ref/ge25519_edwards25519sha512batch.c crypto_sign/edwards25519sha512batch/ref/sc25519_edwards25519sha512batch.c crypto_sign/edwards25519sha512batch/ref/sign_edwards25519sha512batch.c crypto_sign/edwards25519sha512batch/sign_edwards25519sha512batch_api.c

crypto_stream_src := crypto_stream/aes128ctr/portable/afternm_aes128ctr.c crypto_stream/aes128ctr/portable/beforenm_aes128ctr.c crypto_stream/aes128ctr/portable/common_aes128ctr.c crypto_stream/aes128ctr/portable/consts_aes128ctr.c crypto_stream/aes128ctr/portable/int128_aes128ctr.c crypto_stream/aes128ctr/portable/stream_aes128ctr.c crypto_stream/aes128ctr/portable/xor_afternm_aes128ctr.c crypto_stream/aes128ctr/stream_aes128ctr_api.c crypto_stream/chacha20/ref/stream_chacha20_ref.c crypto_stream/chacha20/stream_chacha20_api.c crypto_stream/crypto_stream.c crypto_stream/salsa20/ref/stream_salsa20_ref.c crypto_stream/salsa20/ref/xor_salsa20_ref.c crypto_stream/salsa20/stream_salsa20_api.c crypto_stream/salsa2012/ref/stream_salsa2012.c crypto_stream/salsa2012/ref/xor_salsa2012.c crypto_stream/salsa2012/stream_salsa2012_api.c crypto_stream/salsa208/ref/stream_salsa208.c crypto_stream/salsa208/ref/xor_salsa208.c crypto_stream/salsa208/stream_salsa208_api.c crypto_stream/xsalsa20/ref/stream_xsalsa20.c crypto_stream/xsalsa20/ref/xor_xsalsa20.c crypto_stream/xsalsa20/stream_xsalsa20_api.c

crypto_verify_src :=  crypto_verify/16/ref/verify_16.c crypto_verify/16/verify_16_api.c crypto_verify/32/ref/verify_32.c crypto_verify/32/verify_32_api.c crypto_verify/64/ref/verify_64.c crypto_verify/64/verify_64_api.c

randombytes_src := randombytes/randombytes.c randombytes/salsa20/randombytes_salsa20_random.c randombytes/sysrandom/randombytes_sysrandom.c

sodium_src := sodium/core.c sodium/runtime.c sodium/utils.c sodium/version.c

SODIUM_SOURCE := $(crypto_aead_src) $(crypto_auth_src) $(crypto_box_src) \
	$(crypto_core_src) $(crypto_generichash_src) $(crypto_hash_src) \
	$(crypto_onetimeauth_src) $(crypto_pwhash_src) $(crypto_scalarmult_src) \
	$(crypto_secretbox_src) $(crypto_shorthash_src) $(crypto_sign_src) \
	$(crypto_stream_src) $(crypto_verify_src) $(randombytes_src) $(sodium_src)

LOCAL_MODULE := sodium
LOCAL_CFLAGS += -O2 -I$(LOCAL_PATH)/shadowsocks-libev/libsodium/src/libsodium/include \
				-I$(LOCAL_PATH)/shadowsocks-libev/libsodium/src/libsodium/include/sodium \
				-DPACKAGE_NAME=\"libsodium\" -DPACKAGE_TARNAME=\"libsodium\" \
				-DPACKAGE_VERSION=\"1.0.1\" -DPACKAGE_STRING=\"libsodium\ 1.0.1\" \
				-DPACKAGE_BUGREPORT=\"https://github.com/jedisct1/libsodium/issues\" \
				-DPACKAGE_URL=\"https://github.com/jedisct1/libsodium\" \
				-DPACKAGE=\"libsodium\" -DVERSION=\"1.0.1\" -DSTDC_HEADERS=1 \
				-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 \
				-DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 \
				-DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 \
				-D__EXTENSIONS__=1 -D_ALL_SOURCE=1 -D_GNU_SOURCE=1 \
				-D_POSIX_PTHREAD_SEMANTICS=1 -D_TANDEM_SOURCE=1 \
				-DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\" -DHAVE_MMINTRIN_H=1 \
				-DHAVE_EMMINTRIN_H=1 -DHAVE_PMMINTRIN_H=1 -DHAVE_TMMINTRIN_H=1 \
				-DHAVE_SYS_MMAN_H=1 -DNATIVE_LITTLE_ENDIAN=1 \
				-DHAVE_WEAK_SYMBOLS=1 -DHAVE_ARC4RANDOM=1 -DHAVE_ARC4RANDOM_BUF=1 \
				-DHAVE_MLOCK=1 -DHAVE_MPROTECT=1 -DHAVE_POSIX_MEMALIGN=1

LOCAL_SRC_FILES := $(addprefix shadowsocks-libev/libsodium/src/libsodium/,$(SODIUM_SOURCE))

include $(BUILD_STATIC_LIBRARY)

########################################################
## libevent
########################################################

include $(CLEAR_VARS)

LIBEVENT_SOURCES := \
	buffer.c \
	bufferevent.c bufferevent_filter.c \
	bufferevent_openssl.c bufferevent_pair.c bufferevent_ratelim.c \
	bufferevent_sock.c epoll.c \
	epoll_sub.c evdns.c event.c \
    event_tagging.c evmap.c \
	evrpc.c evthread.c \
	evthread_pthread.c evutil.c \
	evutil_rand.c http.c \
	listener.c log.c poll.c \
	select.c signal.c strlcpy.c

LOCAL_MODULE := event
LOCAL_SRC_FILES := $(addprefix libevent/, $(LIBEVENT_SOURCES))
LOCAL_CFLAGS := -O2 -I$(LOCAL_PATH)/libevent \
	-I$(LOCAL_PATH)/libevent/include \
	-I$(LOCAL_PATH)/openssl/include

include $(BUILD_STATIC_LIBRARY)

########################################################
## libipset
########################################################

include $(CLEAR_VARS)

bdd_src = bdd/assignments.c bdd/basics.c bdd/bdd-iterator.c bdd/expanded.c \
		  		  bdd/reachable.c bdd/read.c bdd/write.c
map_src = map/allocation.c map/inspection.c map/ipv4_map.c map/ipv6_map.c \
		  		  map/storage.c
set_src = set/allocation.c set/inspection.c set/ipv4_set.c set/ipv6_set.c \
		  		  set/iterator.c set/storage.c

IPSET_SOURCE := general.c $(bdd_src) $(map_src) $(set_src)

LOCAL_MODULE := libipset
LOCAL_CFLAGS += -O2 -I$(LOCAL_PATH)/shadowsocks-libev/libipset/include \
				-I$(LOCAL_PATH)/shadowsocks-libev/libcork/include

LOCAL_SRC_FILES := $(addprefix shadowsocks-libev/libipset/,$(IPSET_SOURCE))

include $(BUILD_STATIC_LIBRARY)

########################################################
## libcork
########################################################

include $(CLEAR_VARS)

cli_src := cli/commands.c
core_src := core/allocator.c core/error.c core/gc.c \
			core/hash.c core/ip-address.c core/mempool.c \
			core/timestamp.c core/u128.c
ds_src := ds/array.c ds/bitset.c ds/buffer.c ds/dllist.c \
		  ds/file-stream.c ds/hash-table.c ds/managed-buffer.c \
		  ds/ring-buffer.c ds/slice.c
posix_src := posix/directory-walker.c posix/env.c posix/exec.c \
			 posix/files.c posix/process.c posix/subprocess.c
pthreads_src := pthreads/thread.c

CORK_SOURCE := $(cli_src) $(core_src) $(ds_src) $(posix_src) $(pthreads_src)

LOCAL_MODULE := libcork
LOCAL_CFLAGS += -O2 -I$(LOCAL_PATH)/shadowsocks-libev/libcork/include \
				-DCORK_API=CORK_LOCAL

LOCAL_SRC_FILES := $(addprefix shadowsocks-libev/libcork/,$(CORK_SOURCE))

include $(BUILD_STATIC_LIBRARY)

########################################################
## libev 
########################################################

include $(CLEAR_VARS)

LOCAL_MODULE := libev
LOCAL_CFLAGS += -O2 -DNDEBUG -DHAVE_CONFIG_H
LOCAL_SRC_FILES := \
	libev/ev.c \
	libev/event.c 

include $(BUILD_STATIC_LIBRARY)

########################################################
## redsocks
########################################################

include $(CLEAR_VARS)

REDSOCKS_SOURCES := base.c dnstc.c http-connect.c \
	log.c md5.c socks5.c \
	base64.c http-auth.c http-relay.c main.c \
	parser.c redsocks.c socks4.c utils.c

LOCAL_STATIC_LIBRARIES := libevent

LOCAL_MODULE := redsocks
LOCAL_SRC_FILES := $(addprefix redsocks/, $(REDSOCKS_SOURCES)) 
LOCAL_CFLAGS := -O2 -std=gnu99 -I$(LOCAL_PATH)/redsocks \
	-I$(LOCAL_PATH)/libevent/include \
	-I$(LOCAL_PATH)/libevent

include $(BUILD_EXECUTABLE)

########################################################
## pdnsd library
########################################################

include $(CLEAR_VARS)

PDNSD_SOURCES  := $(wildcard $(LOCAL_PATH)/pdnsd/src/*.c)

LOCAL_MODULE    := pdnsd
LOCAL_SRC_FILES := $(PDNSD_SOURCES:$(LOCAL_PATH)/%=%)
LOCAL_CFLAGS    := -Wall -O2 -I$(LOCAL_PATH)/pdnsd

include $(BUILD_EXECUTABLE)

########################################################
## shadowsocks-libev local library
########################################################

include $(CLEAR_VARS)

SHADOWSOCKS_SOURCES := local.c cache.c udprelay.c encrypt.c utils.c json.c jconf.c acl.c 

LOCAL_MODULE    := ss-local
LOCAL_SRC_FILES := $(addprefix shadowsocks-libev/src/, $(SHADOWSOCKS_SOURCES))
LOCAL_CFLAGS    := -Wall -O2 -fno-strict-aliasing -DUDPRELAY_LOCAL \
					-DUSE_CRYPTO_OPENSSL -DANDROID -DHAVE_CONFIG_H \
					-I$(LOCAL_PATH)/libev/ \
					-I$(LOCAL_PATH)/openssl/include  \
					-I$(LOCAL_PATH)/shadowsocks-libev/libcork/include \
					-I$(LOCAL_PATH)/shadowsocks-libev/libsodium/src/libsodium/include \
					-I$(LOCAL_PATH)/shadowsocks-libev/libsodium/src/libsodium/include/sodium \
					-I$(LOCAL_PATH)/shadowsocks-libev/libipset/include

LOCAL_STATIC_LIBRARIES := libev libcrypto libipset libcork libsodium

LOCAL_LDLIBS := -llog

include $(BUILD_EXECUTABLE)

########################################################
## shadowsocks-libev tunnel
########################################################

include $(CLEAR_VARS)

SHADOWSOCKS_SOURCES := tunnel.c cache.c udprelay.c encrypt.c utils.c json.c jconf.c

LOCAL_MODULE    := ss-tunnel
LOCAL_SRC_FILES := $(addprefix shadowsocks-libev/src/, $(SHADOWSOCKS_SOURCES))
LOCAL_CFLAGS    := -Wall -O2 -fno-strict-aliasing -DUDPRELAY_LOCAL -DUDPRELAY_TUNNEL \
					-DUSE_CRYPTO_OPENSSL -DANDROID -DHAVE_CONFIG_H -DSSTUNNEL_JNI \
					-I$(LOCAL_PATH)/libev/ \
					-I$(LOCAL_PATH)/shadowsocks-libev/libsodium/src/libsodium/include \
					-I$(LOCAL_PATH)/shadowsocks-libev/libsodium/src/libsodium/include/sodium \
					-I$(LOCAL_PATH)/openssl/include 

LOCAL_STATIC_LIBRARIES := libev libcrypto libsodium

LOCAL_LDLIBS := -llog

include $(BUILD_EXECUTABLE)

########################################################
## system
########################################################

include $(CLEAR_VARS)

LOCAL_MODULE:= system

LOCAL_SRC_FILES:= \
	   system.cpp

LOCAL_LDLIBS := -ldl -llog

LOCAL_STATIC_LIBRARIES := cpufeatures

include $(BUILD_SHARED_LIBRARY)

########################################################
## tun2socks
########################################################

include $(CLEAR_VARS)

LOCAL_CFLAGS := -std=gnu99
LOCAL_CFLAGS += -DBADVPN_THREADWORK_USE_PTHREAD -DBADVPN_LINUX -DBADVPN_BREACTOR_BADVPN -D_GNU_SOURCE
LOCAL_CFLAGS += -DBADVPN_USE_SELFPIPE -DBADVPN_USE_EPOLL
LOCAL_CFLAGS += -DBADVPN_LITTLE_ENDIAN -DBADVPN_THREAD_SAFE
LOCAL_CFLAGS += -DNDEBUG -DANDROID
# LOCAL_CFLAGS += -DTUN2SOCKS_JNI

LOCAL_C_INCLUDES:= \
        $(LOCAL_PATH)/badvpn/lwip/src/include/ipv4 \
        $(LOCAL_PATH)/badvpn/lwip/src/include/ipv6 \
        $(LOCAL_PATH)/badvpn/lwip/src/include \
        $(LOCAL_PATH)/badvpn/lwip/custom \
        $(LOCAL_PATH)/badvpn/

TUN2SOCKS_SOURCES := \
        base/BLog_syslog.c \
        system/BReactor_badvpn.c \
        system/BSignal.c \
        system/BConnection_unix.c \
        system/BTime.c \
        system/BUnixSignal.c \
        system/BNetwork.c \
        flow/StreamRecvInterface.c \
        flow/PacketRecvInterface.c \
        flow/PacketPassInterface.c \
        flow/StreamPassInterface.c \
        flow/SinglePacketBuffer.c \
        flow/BufferWriter.c \
        flow/PacketBuffer.c \
        flow/PacketStreamSender.c \
        flow/PacketPassConnector.c \
        flow/PacketProtoFlow.c \
        flow/PacketPassFairQueue.c \
        flow/PacketProtoEncoder.c \
        flow/PacketProtoDecoder.c \
        socksclient/BSocksClient.c \
        tuntap/BTap.c \
        lwip/src/core/timers.c \
        lwip/src/core/udp.c \
        lwip/src/core/memp.c \
        lwip/src/core/init.c \
        lwip/src/core/pbuf.c \
        lwip/src/core/tcp.c \
        lwip/src/core/tcp_out.c \
        lwip/src/core/netif.c \
        lwip/src/core/def.c \
        lwip/src/core/mem.c \
        lwip/src/core/tcp_in.c \
        lwip/src/core/stats.c \
        lwip/src/core/inet_chksum.c \
        lwip/src/core/ipv4/icmp.c \
        lwip/src/core/ipv4/igmp.c \
        lwip/src/core/ipv4/ip4_addr.c \
        lwip/src/core/ipv4/ip_frag.c \
        lwip/src/core/ipv4/ip4.c \
        lwip/src/core/ipv4/autoip.c \
        lwip/src/core/ipv6/ethip6.c \
        lwip/src/core/ipv6/inet6.c \
        lwip/src/core/ipv6/ip6_addr.c \
        lwip/src/core/ipv6/mld6.c \
        lwip/src/core/ipv6/dhcp6.c \
        lwip/src/core/ipv6/icmp6.c \
        lwip/src/core/ipv6/ip6.c \
        lwip/src/core/ipv6/ip6_frag.c \
        lwip/src/core/ipv6/nd6.c \
        lwip/custom/sys.c \
        tun2socks/tun2socks.c \
        base/DebugObject.c \
        base/BLog.c \
        base/BPending.c \
		system/BDatagram_unix.c \
        flowextra/PacketPassInactivityMonitor.c \
        tun2socks/SocksUdpGwClient.c \
        udpgw_client/UdpGwClient.c

LOCAL_MODULE := tun2socks

LOCAL_LDLIBS := -ldl -llog

LOCAL_SRC_FILES := $(addprefix badvpn/, $(TUN2SOCKS_SOURCES))

include $(BUILD_EXECUTABLE)

# OpenSSL
openssl_subdirs := $(addprefix $(LOCAL_PATH)/openssl/,$(addsuffix /Android.mk, \
	crypto \
	ssl \
	))
include $(openssl_subdirs)

# Iptables
# LOCAL_PATH := $(ROOT_PATH)
# iptables_subdirs := $(addprefix $(LOCAL_PATH)/iptables/,$(addsuffix /Android.mk, \
# 	iptables \
# 	extensions \
# 	libiptc \
# 	))
# include $(iptables_subdirs)

# Import cpufeatures
$(call import-module,android/cpufeatures)
