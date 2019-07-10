Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC20647DA
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:13:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLlS0TNFzDqPB
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:13:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DJHF3jnf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QPsSNazK"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLl83bbzzDqJj
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:13:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CF2FA21E90;
 Wed, 10 Jul 2019 10:13:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=hDCc+1B/fxMD3
 q+Aooe1cCSSiOOVd979O3SjKxe+eqc=; b=DJHF3jnfwrDLGRoAOxBtdH+ISOvzN
 LtFGsjxbuR62itA/K+/CHnM9P1yrE2HiRQnPNHJ+e1t2BHVxQhGLuODss69UTooz
 tTbWj7DknJt+onihjFeZWFYYHVqgxaVtAXoF/vUWZwaAGKJk2Sr/KuX5H9lpfPx3
 IWWostGX0jGPnWskBEgdl1Wz9Qjw3fBJZ5xuyIOJ/1rq+UHLAVcIqnb9buwp9S5/
 QT2VlcuH8AqF1VycXIqglbFIvJO3iRu7QXBqFyFYijeOtYJ9odL4Sh8umxOf6/3Z
 PRcKfmKf60DpNiMH3ePd59iI+YGyAVrV8okZrIZEYAGISoqMo4fsGEz+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=hDCc+1B/fxMD3q+Aooe1cCSSiOOVd979O3SjKxe+eqc=; b=QPsSNazK
 NGqI9lDFyzjZF0qDcERrQvjxltVuvc0ZLBk1yKcX0GltvN3w/YBEn69TBS4niauk
 MRJAConv2iR8qSeGn7ajL/SxJujan7Z1IFXbf2GKW05ngGiUlmL1XNF+RrsPYFKr
 Ec7zx18gcLiG6NUI3i7MhTibZLYOH9gnBuQR4KwpOEIhjEEN6T32AWsSLqxDF1ws
 WD309tChQhHdEArTp06qUJW5OLTNZD/yHgalCBh+56q8CLGbMCHbHCR2uVQ+KU+O
 +9VLuhEq184FuEeyBDL6kOCZ7n+eSiPa8cUBi4zgVFan5XoOObw00Sb8yY2qXhdC
 GK7zBb1DnCtZfA==
X-ME-Sender: <xms:kfIlXY7TEhb9AuA3PH-xihyNo5yGdzrh1tWoYXUuyZz1wnhrFTRhCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepudegrddvrdekhedrvddvnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:kfIlXeKcIhzJeYGEpggymKcGKf2wxH3EQk0gnmVX0BW3tX22mUbC-Q>
 <xmx:kfIlXSfFsnHzaTuHc5gtHaVNHdg_lXNT_j59vhW4yAzfbtfQaP0onQ>
 <xmx:kfIlXRcFMqcNwcPzVvquVymUV35STPjNc_iSW9tk7tqOVMGyZeJY1g>
 <xmx:kfIlXWKSnme4ttiwmlfJ1rg5gbeqBqLvHOjEMX7AXkzsqOdzjR99XA>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC4EB380076;
 Wed, 10 Jul 2019 10:13:34 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 1/3] ARM: config: aspeed-g5: Refresh on 5.2
Date: Wed, 10 Jul 2019 23:43:23 +0930
Message-Id: <20190710141325.20888-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710141325.20888-1-andrew@aj.id.au>
References: <20190710141325.20888-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: ryanchen.aspeed@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

$ make aspeed_g5_defconfig &&
         make savedefconfig &&
         mv defconfig arch/arm/configs/aspeed_g5_defconfig

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 54 ++++++++++++----------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 407ffb7655a8..249eeeb55d59 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -20,29 +20,28 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_SLAB_FREELIST_RANDOM=y
-CONFIG_JUMP_LABEL=y
-CONFIG_STRICT_KERNEL_RWX=y
-CONFIG_GCC_PLUGINS=y
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_BLK_DEBUG_FS is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_MQ_IOSCHED_DEADLINE is not set
-# CONFIG_MQ_IOSCHED_KYBER is not set
 CONFIG_ARCH_MULTI_V6=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_ASPEED=y
 CONFIG_MACH_ASPEED_G5=y
 # CONFIG_CACHE_L2X0 is not set
 CONFIG_VMSPLIT_2G=y
-# CONFIG_COMPACTION is not set
 CONFIG_UACCESS_WITH_MEMCPY=y
 CONFIG_SECCOMP=y
 # CONFIG_ATAGS is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_KEXEC=y
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_SUSPEND is not set
+CONFIG_FIRMWARE_MEMMAP=y
+CONFIG_JUMP_LABEL=y
+CONFIG_STRICT_KERNEL_RWX=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEBUG_FS is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_COMPACTION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
@@ -51,20 +50,12 @@ CONFIG_UNIX_DIAG=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
-# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET6_XFRM_MODE_BEET is not set
 CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_ADVANCED is not set
 CONFIG_VLAN_8021Q=y
 CONFIG_NET_NCSI=y
-CONFIG_BPF_STREAM_PARSER=y
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
@@ -78,8 +69,6 @@ CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_MTD_UBI_BLOCK=y
 CONFIG_BLK_DEV_LOOP=y
-CONFIG_ASPEED_LPC_CTRL=y
-CONFIG_ASPEED_LPC_SNOOP=y
 CONFIG_EEPROM_AT24=y
 CONFIG_NETDEVICES=y
 CONFIG_NETCONSOLE=y
@@ -209,6 +198,8 @@ CONFIG_RTC_DRV_PCF8523=y
 CONFIG_RTC_DRV_RV8803=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_IOMMU_SUPPORT is not set
+CONFIG_ASPEED_LPC_CTRL=y
+CONFIG_ASPEED_LPC_SNOOP=y
 CONFIG_IIO=y
 CONFIG_ASPEED_ADC=y
 CONFIG_MAX1363=y
@@ -219,7 +210,6 @@ CONFIG_FSI_MASTER_HUB=y
 CONFIG_FSI_MASTER_AST_CF=y
 CONFIG_FSI_SCOM=y
 CONFIG_FSI_SBEFIFO=y
-CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
@@ -232,6 +222,17 @@ CONFIG_SQUASHFS=y
 CONFIG_SQUASHFS_XZ=y
 CONFIG_SQUASHFS_ZSTD=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_HARDENED_USERCOPY=y
+CONFIG_FORTIFY_SOURCE=y
+# CONFIG_CRYPTO_ECHAINIV is not set
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_SHA256=y
+CONFIG_CRYPTO_USER_API_HASH=y
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_XZ_DEC_X86 is not set
+# CONFIG_XZ_DEC_POWERPC is not set
+# CONFIG_XZ_DEC_IA64 is not set
+# CONFIG_XZ_DEC_SPARC is not set
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO=y
@@ -250,14 +251,3 @@ CONFIG_FUNCTION_TRACER=y
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_DEBUG_WX=y
 CONFIG_DEBUG_USER=y
-CONFIG_HARDENED_USERCOPY=y
-CONFIG_FORTIFY_SOURCE=y
-# CONFIG_CRYPTO_ECHAINIV is not set
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_SHA256=y
-CONFIG_CRYPTO_USER_API_HASH=y
-# CONFIG_CRYPTO_HW is not set
-# CONFIG_XZ_DEC_X86 is not set
-# CONFIG_XZ_DEC_POWERPC is not set
-# CONFIG_XZ_DEC_IA64 is not set
-# CONFIG_XZ_DEC_SPARC is not set
-- 
2.20.1

