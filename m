Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D398C80E52D
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xpmkhpcc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9qb5Pv9z2yyT
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xpmkhpcc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qP3RHQz2ytJ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:09 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d0bb7ff86cso47174095ad.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367647; x=1702972447; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hLAkJYqh5vIw0PwclUtW4cStuFQ6fy/7mCCMuD7gQ4=;
        b=XpmkhpccqhS8tDxsobKOkxfK2WeTljdVvc2sICtDoY/xvtwd5EYkvqUEhK11fHoaGL
         qdhp+erMKepcHQC6OZWXLyP5HyHUKEQ/P6FcJQK6Wa5yksQe7Muf3ZHh6JK+FryaqqS2
         /kT8eFkOApApwSNdLnrd6xsl5fjpQ2VnVq179xHgfKy2dv2m24ECAV7tspEsD3SE9h8O
         mKIr5Decr50P4OsFGbYClZCd5LP8q59OyKxc05luyTzO6wocm38RgnD7ynn19rD7sJC0
         2UgMemwbm61BBgB44D7dLi+UxlTw5BNYHwXIb2PdACYltcEMcdSsZ0QXj2vuZeu8duo5
         Y7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367647; x=1702972447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hLAkJYqh5vIw0PwclUtW4cStuFQ6fy/7mCCMuD7gQ4=;
        b=mDU0naN8nSWFsjNgJSckC410dJ1oFZbLNUYzx/biLf28uBSTpZj2oitB0zO+NahIjp
         L5ZYt9CCBeWbyrQzpFtjEmekwVvV8uAB0/Ki64KUT/ygnbuf6TLG6rUER2eZTOjmOc/3
         jffpbDiBP+VqRLUIWfcRqjcf2rdVRVPXBK1PGfXgeMNF7Zsb+kjFGA8oPYiUuD/yZrPl
         qAVBGD3rU35EOUqCkGK461RNg0RFLRkGs+Xq2lmjINHUopVCmN6ussaFqj7Sjz2s/LC4
         OGGpf3xbeCuh/Bz1kKWPxHRUcrShrCWDPnFtRDY9GH8FN8PEnOq/KnMaBrI7B+97rczU
         Np6w==
X-Gm-Message-State: AOJu0YxEBqVvm4kHnFVbC7FW+PxEhRv2Fz1W4i7nzy3ZvtDwlJoDQPVP
	/wKpIWbA91ftBpyl5MhO+gc=
X-Google-Smtp-Source: AGHT+IFzl5/4KHd0c4eJu51FdvpkTwoMSew/3UdLZxGnzPbpxbNtS9KEm1/sM6ZymTzAW/BRC1IT9w==
X-Received: by 2002:a17:90b:19d8:b0:286:7ec2:df49 with SMTP id nm24-20020a17090b19d800b002867ec2df49mr7008802pjb.9.1702367647535;
        Mon, 11 Dec 2023 23:54:07 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:07 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] ARM: dts: aspeed: minerva: Revise the name of DTS
Date: Tue, 12 Dec 2023 15:51:50 +0800
Message-Id: <20231212075200.983536-2-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The project Minerva which is the platform used by Meta has two boards: the
Chassis Management Module (Minerva) and the Motherboard (Harma), so change
the DTS name to minerva here for CMM use.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile                               | 2 +-
 ...facebook-minerva-cmc.dts => aspeed-bmc-facebook-minerva.dts} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/boot/dts/aspeed/{aspeed-bmc-facebook-minerva-cmc.dts => aspeed-bmc-facebook-minerva.dts} (99%)

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index d3ac20e316d0..b1da302dbcd6 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -19,7 +19,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
 	aspeed-bmc-facebook-greatlakes.dtb \
-	aspeed-bmc-facebook-minerva-cmc.dtb \
+	aspeed-bmc-facebook-minerva.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
similarity index 99%
rename from arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
rename to arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index f04ef9063520..c755fb3258a4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -7,7 +7,7 @@
 #include <dt-bindings/i2c/i2c.h>
 
 / {
-	model = "Facebook Minerva CMC";
+	model = "Facebook Minerva CMM";
 	compatible = "facebook,minerva-cmc", "aspeed,ast2600";
 
 	aliases {
-- 
2.34.1

