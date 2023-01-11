Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B07665AD0
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 12:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsQzJ5bcyz3cdJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 22:52:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oZkMOTv8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oZkMOTv8;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsQz84JHSz3bVr
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 22:52:34 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id m6so23111600lfj.11
        for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 03:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=akX8Spsmb8eHc45qxyT07eMq4v6BQfaJuDvgRydNQ0U=;
        b=oZkMOTv8VzItNdeoOagEla1tgEF0wFLmF31sfOgof2//fXwwUxxnP0BYRXJ2pYwZNK
         YMvvL9Uez4P5ApEM2BkEvxg/3eZamx/ft+/VFJ0eVZ8atnAT5vdsV9tglCZJ5t8WcO5f
         mKK4/fQoduWWAPVE1EUHJV2b1WL/23dH+U/7DfLPqdehABg8h4TSC6IVsmf89BndNdmt
         0SCpOhjlrw8VvYSXTkGgGIBx+7y4VEaO/UxMk+UkjRTapOxfmVGDViDjY4kfo4a1BHW0
         HDnjsubkMOB95AszsJFszQmW0mw6TIqJ9ES4VPJHWA6805Vpz2Mo1jr4eOkL8aRbQ9HB
         DwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akX8Spsmb8eHc45qxyT07eMq4v6BQfaJuDvgRydNQ0U=;
        b=GAeprMqDBmYNgs+lk3vFKtBCr5cY7ybpEtd7TZXXc1jbdBhSIsdm8Z6pDRADcnD6TH
         teSFX5+fzzNxt+Lb08w7fmdnjFTQlMEhz9NmH9yL6W4rGG37yV2Ozl48DtYVo7h8gTYV
         +sDQTwx4UZFq/LYKeHX0wM/yld1X7FRPw/1FBufdC7E+4RMY4yQN5+kXyoEL+QZuirwT
         9VkgVD5PaL3+ebwbCREpzz2/HBVGEbL6+Zcxl5OvZ43J6gLev5QlDL68WI2xRhShXIcb
         2jU7sixvfX9disvITl6IsW6/CaNoVZpqMsAN/0uDTNuT6RBkPCo6047km/rV+z6bA9pQ
         wKSA==
X-Gm-Message-State: AFqh2kq/ZVx3qTq0Y/DqIRRhOJzV3w2OIpgc0joLiNlLzbO3Nxm2a6/d
	Zbv/qI9JYtJN1ShWUZl6LrY=
X-Google-Smtp-Source: AMrXdXsZ2CI7/xZBxfernCt7RhQ7XRGyHhWU/FBiLhf5qGEAexunzC4zJICg6uyMk70PL9RBXuITPg==
X-Received: by 2002:a05:6512:202f:b0:4cb:ca5:b5ba with SMTP id s15-20020a056512202f00b004cb0ca5b5bamr13375670lfs.29.1673437951291;
        Wed, 11 Jan 2023 03:52:31 -0800 (PST)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id x11-20020a056512078b00b004b5821219fbsm2711185lfr.60.2023.01.11.03.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 03:52:30 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: ethanolx: Enable CTS/RTS pins on UART1
Date: Wed, 11 Jan 2023 14:52:27 +0300
Message-Id: <20230111115227.1357-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Konstantin Aladyshev <aladyshev22@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

BMC UART1 is connected to the P0 CPU UART1. As the connection has
CTS and RTS signals, enable these functions on the BMC side.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 5f9093c58e8c..d8e8fca44c78 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -90,7 +90,9 @@ &uart1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_txd1_default
-		     &pinctrl_rxd1_default>;
+		     &pinctrl_rxd1_default
+		     &pinctrl_nrts1_default
+		     &pinctrl_ncts1_default>;
 };
 
 &uart5 {
-- 
2.25.1

