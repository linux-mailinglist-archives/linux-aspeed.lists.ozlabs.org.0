Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D01FD8A2AD9
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:19:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N7u9c2Jg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wy4RWRz3vf6
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N7u9c2Jg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wV2K48z3vbb
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:34 +1000 (AEST)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36afd27170fso3159655ab.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913511; x=1713518311; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrsvdI1lEYG0uIgU/VTd61D6Q1rZXhoZ89VFb5WgrsQ=;
        b=N7u9c2JgVb3XF6Szu07aywfid/CZ98XMxt9wXwtKy5DiP+Bna8FIYWB3BpcUPTsX8z
         ibBIQqqjZKTxie1zBFvhF8NS29CAq6KYcSL13SfIXLBr46oX55S9FCGWw7kZ67OxbOgR
         9evwCUa0YBwcVkpmD3rDlMwqWt2EasIKgHfhThqtwLQ2DTJhWCJHjuZbwzSzESqYtci8
         fX3MbEzZvojjhvNk4l3SoVU9MdOdkS/TALGZV7zpu8aj62s5RlylLWsJcc03szIloahJ
         8Uj5vgNBGfIBU0VQhEUY4z31AISs64xQAdrlFJSRPFqjKik9nEDnATW3xroTLPWxyRhQ
         EgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913511; x=1713518311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrsvdI1lEYG0uIgU/VTd61D6Q1rZXhoZ89VFb5WgrsQ=;
        b=tBKDL3htL20i1pj9ninw5DXYpD0SYMEn/MLbZF39t55zXMQc27CI8O5bj7NApbyDxu
         SvNZODfy1mn/REgnP8L+Bhfkov/5TlZGwDFESlQ+PAmt+7Q5Ah7TFVdlZ6o4FU5M5X0o
         cerAEHjFfN7aqvdPT8r5po2Wur+XRr4qm9Wi4LmMetDHbY3qC4NWH35WCioWw8DYbztV
         ApXxE+NHHKvCZJo2/vHhkCyBkZaVCjeamBKod3CNzJdkPuJxgfGDWwpvMW2MxGIqxPQD
         t1/Jz0lStbUKoEWltReGXGLYiBZa+2FDeaWX8jIrtu7F3fgLhtVseWLcmrFOeTEn1+uE
         3b+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFn2mTPqn6ulCLkoBQeHidJU4jQUSq0TefV0Ieax3RVxI6dpNDv/IR7zqhGMdUouwXsLPEJnl9lL3sZC5yFbshN7cbYk946p8QEUvSsQ==
X-Gm-Message-State: AOJu0Yy0bc8GbKm/7sM7j12/pqx3fDXv9MvNYLWWtr24lZQTSWdXNfad
	C5UDvtl+yPkSEi98cv1bh+/CSNTJLu27WLysxLzfN+QHxxSAe+AE
X-Google-Smtp-Source: AGHT+IEGmA2j+bho3mUExB5XbbPY7HsXPCIrX7u2g7/zilrGNxmZEgiTMx2EcNNyUVmKSP+iORhPnA==
X-Received: by 2002:a05:6e02:1807:b0:36a:fe3d:157d with SMTP id a7-20020a056e02180700b0036afe3d157dmr2354709ilv.25.1712913511254;
        Fri, 12 Apr 2024 02:18:31 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:30 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/12] ARM: dts: aspeed: Harma: Revise node name
Date: Fri, 12 Apr 2024 17:15:58 +0800
Message-Id: <20240412091600.2534693-11-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
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

Revise max31790 and delta_brick node name.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 7dd48c384a4d..530f69005857 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -192,7 +192,7 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -218,7 +218,7 @@ eeprom@50 {
 &i2c2 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -262,7 +262,7 @@ eeprom@52 {
 		reg = <0x52>;
 	};
 
-	delta_brick@69 {
+	power-monitor@69 {
 		compatible = "pmbus";
 		reg = <0x69>;
 	};
-- 
2.25.1

