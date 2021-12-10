Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7019246FDEB
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Dec 2021 10:36:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9QlY2nFDz3c6f
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Dec 2021 20:36:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=2HZ8pFJ9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2HZ8pFJ9; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9QlT2p7Bz2xg3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Dec 2021 20:36:37 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id m24so7564636pgn.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Dec 2021 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FFsQwjzhgSyKAUENvfBIFY+4uCH9mkGIaj8EHI/MgtM=;
 b=2HZ8pFJ96JZLj13duu4Zv3yCHVfq4Zvb5DObtluxYN8pRA1VHPgMn5e/SuxAL7/6gs
 8PP7cNkLq+G0iKZxU+8Nhy8efBi1gVoxsJ8GCrVdrqtlL8oF2tBhAW0PCxrKoV9eGh4K
 9gNDtwRri8Q8OvRKv/gG/jQ/8HvZiIw4kpMv+DIicaEAfG5RM16QsLKePuKPDQS84AY+
 lsJbF11WJCzp+Ny9jl1qFWpabfTll6zWZngYHtujZ5WtMYKJMxuHvvU76e3/+gWjYXxy
 hwKASuGz+uKCPSmOY5DUTGipvxCHMUu5X0gOs98LNqECU1qDq0k0/f3ls+z36jTtmIeA
 a2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FFsQwjzhgSyKAUENvfBIFY+4uCH9mkGIaj8EHI/MgtM=;
 b=ysrGamyX2jcqFHXmdX+nlcfhHygZgkW0KJzjSVt1/ht+gQBSsLG7n1qIpTKg0HacdD
 1bO+C3ce5WPYDpcnIchpVth3Y7TIk+zwQeeFzLjJ7I7JxzoITWfpkvmFQDkMaEGMmeic
 C1zDp18UDCCjVrfmgU6UL6g2Sf72WIo1iXSeElxNNcdJKsSy6wgbE5y0aRV9i15qaJsc
 m7r2MSI9yEhE2cgFfT21lurIScpQM9duP62Fx9b0sJYi+jLTkK9/8Vgmj9gcYt1vCL59
 1mxGfqGr28bIkFQHtIuUvmftUGn7UxRjDq5p3DJWGDSUS5L8PW9YZvRIwzJgch1smokf
 nroQ==
X-Gm-Message-State: AOAM5315YJuLn1x3xR9SFPzY/rjwmsQ7lGQkR6jxKUQj8xotWOD3sVFW
 g92X52NGUbvE081TEQgITe6q/+rxZ2w3Wmcn
X-Google-Smtp-Source: ABdhPJxfgd7xqWpUed8nHPtc7th4BGQX/oU3cVlecMdpTmljzsHJb1raImLHfPrW51SVtK7EXikrhA==
X-Received: by 2002:a05:6a00:1783:b0:49f:c134:c6e2 with SMTP id
 s3-20020a056a00178300b0049fc134c6e2mr17192053pfg.0.1639128994705; 
 Fri, 10 Dec 2021 01:36:34 -0800 (PST)
Received: from localhost ([49.7.45.40])
 by smtp.gmail.com with ESMTPSA id mn15sm2263884pjb.35.2021.12.10.01.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 01:36:34 -0800 (PST)
From: Lei YU <yulei.sh@bytedance.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc <openbmc@lists.ozlabs.org>
Subject: [PATCH] ARM: dts: aspeed: g220a: Enable secondary flash
Date: Fri, 10 Dec 2021 17:36:23 +0800
Message-Id: <20211210093623.2140640-1-yulei.sh@bytedance.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable the secondary flash of the g220a's BMC and the wdt2.

Signed-off-by: Lei YU <yulei.sh@bytedance.com>
---
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index 01dace8f5e5f..05f392f42960 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -260,6 +260,13 @@ flash@0 {
 		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
+	flash@1 {
+		status = "okay";
+		label = "alt-bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
 };
 
 &spi1 {
@@ -278,6 +285,10 @@ &adc {
 	status = "okay";
 };
 
+&wdt2 {
+	aspeed,alt-boot;
+};
+
 &gpio {
 	status = "okay";
 	gpio-line-names =
-- 
2.25.1

