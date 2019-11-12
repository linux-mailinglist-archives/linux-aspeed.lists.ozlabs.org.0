Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C012F8887
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 07:30:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByXQ1rv6zF4dh
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 17:29:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F7OVifkj"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ByWj0g0GzF3xf
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 17:29:20 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id h27so11187511pgn.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 22:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dNvJ2cs4tAGXPExkj7A0Re52pBXDxSxw0BIjvNkjJu8=;
 b=F7OVifkjIrygr9D4R4XtO3tVFDVrpBonHzRqGyS2DVefX7FsMEa/jf8CMjIxiynXFB
 LYIfmNyzluotu/u6ostkZaTt6uPbqCvj1Xx8PrVWCmVuCsCjAnzvCz9M1L6jaiHdiFoT
 oJ0t9lPpK1cdAL68kofm0RehcQstgxKSsYY75CDIYV3u5SGhgH3ZYyDcI9guNl3SGiCv
 KJ9a3oxTci6V8jblG99MmTgQtYaIaiisdoOWuSrRdvQyfRxkpj85THXTDnqDxLnvmyzp
 M6t3Es3v9k0NsRHGcHc0k7QhVz/7lwLQFEwbXiL1bUwOKSK2rqpzVK4GmKwx34joI1s/
 Y2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dNvJ2cs4tAGXPExkj7A0Re52pBXDxSxw0BIjvNkjJu8=;
 b=fBSc9z+kXHkraFjqE7RA00/F/aYenYAzDcS3sdtVhzhSG6IlX4HL/ZEb/OfJLaHxKu
 RjWO5ZazLfV2j5hj2jnuq93X5an/fGLr4d69ch4hPfC/jP2t68FKUnqFCA8cVT1IpeH0
 RgL7LxWjkuzxPAktVW/LPq0Klyz8PJ0K1ZlJ1jyfU5mSaawxcdUGArx4nkjwDBy2sqqf
 +9CuUsgeLC/g6RhiI2w9n+Eja3/S1K3cte8NAI7WMJpRBu0X4/grnYiZai+rN9u/ME4n
 AGNn3OO6g8jT94OAS0CrlU9ezzkn0r7Z2JuvfIC6ygLcgZiUCZhcAu9WYhW5UkZ58C6P
 KORw==
X-Gm-Message-State: APjAAAXQtk9XXDOUspcWqTZ7b+kmpceRpJ9J+QvBDS/x2Y3FCg/a8Lq5
 yXeHNojGzHKVxZJRDEom6jM=
X-Google-Smtp-Source: APXvYqzqXFq5V6oZb0+sSrZU/+YjVel/HfInYAtocN5GTsK1ZEzVr8+r/pAY5LYYpaa1Ss7xWmUITw==
X-Received: by 2002:a63:e647:: with SMTP id p7mr14590379pgj.47.1573540158249; 
 Mon, 11 Nov 2019 22:29:18 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x20sm18573707pfa.186.2019.11.11.22.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:29:17 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 4/5] ARM: configs: multi_v7: ASPEED network, gpio, FSI
Date: Tue, 12 Nov 2019 16:58:56 +1030
Message-Id: <20191112062857.32638-5-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112062857.32638-1-joel@jms.id.au>
References: <20191112062857.32638-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable drivers used by the ASPEED SoCs so the multi v7 defconfig can run
on those boards.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/multi_v7_defconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 13ba53286901..124f50dc9cc7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -244,6 +244,7 @@ CONFIG_BGMAC_BCMA=y
 CONFIG_SYSTEMPORT=m
 CONFIG_MACB=y
 CONFIG_NET_CALXEDA_XGMAC=y
+CONFIG_FTGMAC100=m
 CONFIG_GIANFAR=y
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_E1000E=y
@@ -437,6 +438,7 @@ CONFIG_PINCTRL_MSM8X74=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
+CONFIG_GPIO_ASPEED_SGPIO=y
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_EM=y
@@ -1041,6 +1043,13 @@ CONFIG_ROCKCHIP_EFUSE=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_VF610_OCOTP=y
+CONFIG_FSI=m
+CONFIG_FSI_MASTER_GPIO=m
+CONFIG_FSI_MASTER_HUB=m
+CONFIG_FSI_MASTER_ASPEED=m
+CONFIG_FSI_SCOM=m
+CONFIG_FSI_SBEFIFO=m
+CONFIG_FSI_OCC=m
 CONFIG_EXT4_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.24.0

