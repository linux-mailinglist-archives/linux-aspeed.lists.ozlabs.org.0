Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BC5445B86
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 22:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlbql04GLz2yWG
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 08:09:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rZMYILro;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::b49;
 helo=mail-yb1-xb49.google.com;
 envelope-from=3cuyeyqmkdmqy2uqyyqvo.mywvsx47-k2zoonvs232.y9vkl2.y1q@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=rZMYILro; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlbqf74Znz2xWd
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 08:09:32 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id
 l28-20020a25b31c000000b005c27dd4987bso10266255ybj.18
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 14:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=7eAvWZMUuk83qtD9UGD4CmQ/pWSKrNHVd5Ady12gMfg=;
 b=rZMYILror75Ht0AoBH/ZsvgKjVwaFo18MhCkuaBu13bkWfTbN1VZGREiucrugYQnjk
 3PM0CUGc+QnXp+VyClKs2qeMxLzOz8kHqoO2X3yYWHa7tq2s+P+BnTRhPg8Cyw2zaRJB
 PLh1+RH+WjaKHpXmdyRLZhyHgTW5U+aLTyVJ4sNzlJEIyfBHqqOrt/1LqACMPALQ3SS+
 e3NzjxwdTc2Nwdl1S6gn/zcrMU38LQPuxNEk86vrKBgT+orwFNRN4jU6PvAPVBzXNi3C
 dJ0tpmBiU9j3QsWpaIjLb2YNsob85WX1E67j+q38ZnnDne8zoRdfW9LcYQhbikrokLhu
 fYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=7eAvWZMUuk83qtD9UGD4CmQ/pWSKrNHVd5Ady12gMfg=;
 b=NqXTXxTNSIaqQomj+ijdhOYchpuYDzzhUv5JVdjYLTy59lTDXDtNmI4qDNRg+RCs2t
 gBSKyB160IgVOQTcXRvue6kH020Pm8wrOqNWWlXt5t23RAtE/XcYHLS9ibJuyNOkd1YE
 RqAccCUWZmNgv+hPZbeYMUcQiBvlBm1aCeM2CPFhAJcEz7QwvXuDG0hO61Z/SfQiBGdx
 3ydfOZUf49NyJsOYCWO1K88pTIB0aSqNUh6onG8omzlKAFddCW4kuswMQgsjpnjzGqiJ
 UxnjJ4Rpvkg6NkgRqQ0zRL5sNACCD2J/Mw9LugIDHkOzoi5u37jbok6ZpUj/X6D6rAqX
 mHiQ==
X-Gm-Message-State: AOAM533GzavzgcqDAJtEnrVCf+1QsNocvaLJV/DfNGzWsDQwDFpexM7g
 d7RunUDcc1JxT5VF1yZ67Y736i4=
X-Google-Smtp-Source: ABdhPJwY4ltXWbOSiMhD5uAht74woKKOsNOUMTZw+v1ATbZtma+JpvQiGfD/6x46fgOGYQGcXioAnH0=
X-Received: from osk.cam.corp.google.com ([2620:15c:93:a:24f7:55ac:2f28:525])
 (user=osk job=sendgmr) by 2002:a25:c907:: with SMTP id
 z7mr59727605ybf.172.1636060169398; 
 Thu, 04 Nov 2021 14:09:29 -0700 (PDT)
Date: Thu,  4 Nov 2021 17:09:14 -0400
Message-Id: <20211104210914.4160448-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
From: Oskar Senft <osk@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This change updates the configuration for the nct7802 hardware
monitor to correctly configure its temperature sensors.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
index 68f332ee1886..fc1585f34a57 100644
--- a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -213,6 +213,29 @@ &i2c0 {
 	nct7802@28 {
 		compatible = "nuvoton,nct7802";
 		reg = <0x28>;
+		channel@0 { /* LTD */
+			reg = <0>;
+			status = "okay";
+		};
+		channel@1 { /* RTD1 */
+			reg = <1>;
+			status = "okay";
+			sensor-type = "temperature";
+			temperature-mode = "thermistor";
+		};
+
+		channel@2 { /* RTD2 */
+			reg = <2>;
+			status = "okay";
+			sensor-type = "temperature";
+			temperature-mode = "thermistor";
+		};
+
+		channel@3 { /* RTD3 */
+			reg = <3>;
+			status = "okay";
+			sensor-type = "temperature";
+		};
 	};
 
 	/* Also connected to:
-- 
2.34.0.rc0.344.g81b53c2807-goog

