Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D2665A6D
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 12:39:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsQhM1dB7z3c8y
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 22:39:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UwYrL8Un;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UwYrL8Un;
	dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsQhF750Jz3bP1
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 22:39:41 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id n5so15190068ljc.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 03:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F278+CdLu00LGOW20/JjUK3+T9UMs52TWsYg/Ly3uH4=;
        b=UwYrL8UnUhJDw57/zjh8AdHAwxztTwIZhhQLjooHcoNZkxUhBvLFf56JRwrqCC+vMQ
         bzny4hMhbIJP+264xtvnTahD8GzhsJJoVbDAghK7A82UgICDeo2orAQHEss0LM8Lkfz+
         eh46J07tqz0l6ZhVejPsr9RU6I2DLbcsw1AMwvbCCKpH77cnAoWVQpb3Yrq8mzlcA0MX
         DGDf2X5csuoRP7gLyJBPWG3ZIAsg2CJoyVXH8pOfvQ91JRPpI2AjLtv+SV7taHH8O672
         EMYsbQG6GSaF94UD973lMPCbJnkLAIV++xJh5CiRArYU6WAfjZWSEqNcUK4814cYSmy3
         FvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F278+CdLu00LGOW20/JjUK3+T9UMs52TWsYg/Ly3uH4=;
        b=VPYSd1DHLZ797aymJfPF0/wySC4TRKK4qFQc2frfD2ElREJTwT/ygTWC62wFD2Hu9o
         Km1dnilNJSyQU8QMXRpLqbQRdB1vjJGzyz/ZD0H3HeAtJOt5ANdAga12QUd1mbh7d+vT
         c2cJao+DuvlMRyQB7Wd0kVE8qMZ5oywoiPoogOtu3o3OJSffyA7KONyZ77BD89dGLnRz
         WnqRUYl/45E5QkklQ/FhhyvEw76ceQsXxjcMrgDi2hAT6vRDVZ0MeN1oIpmXgJtyGF3e
         P1x28nSjsRgpD15tPmEntWOeLCsis5rq8JclEEVIpXYlehc3AEvmXvmKSoZZwe7KqFxj
         rwhQ==
X-Gm-Message-State: AFqh2kqZ6fx2zHCcCuKyTC18VQmjyIpPNBDcvp9uJB34Zkjji0GmbjUo
	q9A/Dm0qStJeuGiJzOgkOP4=
X-Google-Smtp-Source: AMrXdXuODS09DBJLpA4KXi0N30+8JtV3HKr0e+mreGnisaz4yoJkGzE9Z1jrgPPRju5GLwZ+SYb5yg==
X-Received: by 2002:a2e:3807:0:b0:27f:ca4c:304 with SMTP id f7-20020a2e3807000000b0027fca4c0304mr13795174lja.11.1673437176442;
        Wed, 11 Jan 2023 03:39:36 -0800 (PST)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id h23-20020a05651c125700b0027fffd54dadsm1708863ljh.73.2023.01.11.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 03:39:36 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: ethanolx: Add BIOS flash chip
Date: Wed, 11 Jan 2023 14:39:34 +0300
Message-Id: <20230111113934.1176-1-aladyshev22@gmail.com>
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

Add a BIOS flash chip to the DTS to open a possibility to reflash the
main CPU BIOS from the BMC.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 8d84dcc06221..5f9093c58e8c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -63,6 +63,17 @@ flash@0 {
 	};
 };
 
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bios";
+		spi-max-frequency = <100000000>;
+	};
+};
 
 &mac0 {
 	status = "okay";
-- 
2.25.1

