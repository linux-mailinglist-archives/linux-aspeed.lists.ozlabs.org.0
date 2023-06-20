Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD77362A2
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Jun 2023 06:23:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lFt9i1w9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlYR14BWvz30dx
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Jun 2023 14:23:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lFt9i1w9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlYQr6xcxz2xH6
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Jun 2023 14:23:15 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b5422163f4so25981305ad.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jun 2023 21:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687234989; x=1689826989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sWugWrcKT8rsPViGx5Q5IJ8yM6QsbRM7k2be54DgaWQ=;
        b=lFt9i1w9FzB933wE7oXm6cx+XuzA4Ii7grj3/Gs3/qkkWwq1oWYNe+rYqCPsMINo2p
         63rrjEILO5xJY+klimBJMNuNoWqCQaVgHMJSkEA2plqUSVIUmgAkbLWhZlztQTiTY/GF
         abbxvcZnZfK/NAmqAFaRSJ6gvahi2Hqq954P8LiC+VOwvOkte7USa4rlcUUmcSBFXGY8
         Xhe1QQ7lSDlpaCELsnDafbNbCznXk/v4vndel4+jQPWgcQ46fBnSa0nznoZmBG1bHMux
         HYYLTGK7Bl2f/fJRqLKktQSspnCvizRDO6jygNhOp6KrDVqklOzoFls71tffsDmtIvKP
         7/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687234989; x=1689826989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWugWrcKT8rsPViGx5Q5IJ8yM6QsbRM7k2be54DgaWQ=;
        b=KISSyi2Yz6UbnUd2SYUg2WTnhffUPv8Kgg7VfwJUb6zKpJ/RoWZbsVAVU+kJ2iOwwz
         s/M/3mSoHNvDIQL7D8NG51plSt3cBsW79HGF1kEeX347T9YVfQFA8hzXxlFANaAry4I9
         fmH7lThBdaEwh7tXvFJGP626ZLtYfCqEeu6O+UtM3tzzvGGMucgLShL6h4Dspzn7FKDi
         ZNtDMlZDjip3lCWI+h3W+tpfdhMc1Mty3+JZRQhzqmaHa73SA+ZtmpTN2QO4MSalGQVh
         UAaKys/wBd1XhtCgS948Q3B9kgGigPeFfBrEE9dKzvEqn8TWNd7cxM7Vgk43ERXkxEMl
         JSuw==
X-Gm-Message-State: AC+VfDxAp4Vf52fwwZTKkwulpPTRaD3i6pVvXvYb44iP/K/2ZW66r/9W
	7G/a4i0EtEk1Pc3G+x/NekhDqRGniWA=
X-Google-Smtp-Source: ACHHUZ6Vz3yhkVz4KUOayoNEvIZh2iPRA8lLI9RIPPsM4oQLvtVPcPPXTNFjSC4CVAQ2S1rIFoHZkw==
X-Received: by 2002:a17:902:e810:b0:1ad:f407:37d2 with SMTP id u16-20020a170902e81000b001adf40737d2mr14554654plg.5.1687234989049;
        Mon, 19 Jun 2023 21:23:09 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b001b510f55296sm552723plh.174.2023.06.19.21.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 21:23:08 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Add AST2600 VUARs
Date: Tue, 20 Jun 2023 13:52:57 +0930
Message-Id: <20230620042257.73665-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 has two more vuarts, placed between the existing two in the
memory map.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index cc2f8b785917..d1da756690d9 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -716,6 +716,16 @@ vuart1: serial@1e787000 {
 				status = "disabled";
 			};
 
+			vuart3: serial@1e787800 {
+				compatible = "aspeed,ast2500-vuart";
+				reg = <0x1e787800 0x40>;
+				reg-shift = <2>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_APB2>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
 			vuart2: serial@1e788000 {
 				compatible = "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
@@ -726,6 +736,16 @@ vuart2: serial@1e788000 {
 				status = "disabled";
 			};
 
+			vuart4: serial@1e788800 {
+				compatible = "aspeed,ast2500-vuart";
+				reg = <0x1e788800 0x40>;
+				reg-shift = <2>;
+				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_APB2>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
-- 
2.39.2

