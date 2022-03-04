Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AEA4CCA66
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 01:03:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8p3g34HHz2yPv
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 11:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hi2XA1mG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hi2XA1mG; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8p3R4rKhz2xWd
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 11:03:31 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so9190662pjb.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Mar 2022 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wLbnAogNT/oWqYux4yLvZ6VmokfE6BJtRW5+y3qAKWc=;
 b=hi2XA1mGuWmzBzW2eI21+QsIerzLq33JIxiQE5ib685tWM9tZWUvnicxNP8036rM21
 u6fRHECcwEvvDNdCvQbJuComVS7o2Q89BBXL1/NDnR0RHJUQXDq2U6UHAuN7+TxO4eW0
 4SgV7FZnhLt50QFYEBELcSByrEzKbYDqLphlprmwV641hOF2t+Y1czJPeuofptpykR3t
 iDCnhEOK7DA9aDrBepcvkBbqWH7arkkPvCch6hH6bXgQCmbwm4H0XZ5FqVNRn83I8mXi
 TZwQ3Zt2y0mfKNo76TqOGc54qd8K4u6RTit7M6Zupof3RKtFDlfece48fZzkyrrH2apC
 fJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wLbnAogNT/oWqYux4yLvZ6VmokfE6BJtRW5+y3qAKWc=;
 b=SLGVZiCiYsbkyfNL+3pS6JfqdTzkLwKBFe1dwT5Dc3AJMqtLE2LcuX8w+SFy4P8zx3
 1k6xRNhmfKBvfDiLfoF08VSJKNEuofWZc3HtSPH7PWuN1EVkYQyKHnmAvwUM0TPQsxDn
 6epnTVY8GcykZy63BDZfrtFkUXm8PTmaKaW3PWFwSZhLIpWBKNoXIkhoBCyStTTf/R4d
 hT4x478dCJK8Z1d8zPdthW6GYPHoxIhRH36zfXZ12wUlT3dVxSqmArrGQqftPCQt/ByA
 pkG3nh4ObOsq4SonKCzcucl0u0ZcTWXulCFk9zRzD7zBXqqbTN4/CnNUqVTq0EdGJj5Q
 ebYg==
X-Gm-Message-State: AOAM533MjzENIMJpFON7LaQd/Vd63KRtosP8tdK8lRpJTLspAQfvojXA
 qwsX1fTFbtGs9YMMO8ooWCQ=
X-Google-Smtp-Source: ABdhPJyELqxSTPbuNUbV618Zl9NffFmwo6n9gQkEBZYjAx7lveDnXUSUAAOKa93JYUPwetl8+4Ufdg==
X-Received: by 2002:a17:90a:4749:b0:1be:ea64:4348 with SMTP id
 y9-20020a17090a474900b001beea644348mr7804979pjg.231.1646352210357; 
 Thu, 03 Mar 2022 16:03:30 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 z8-20020aa79588000000b004e1dc67ead3sm3579070pfj.126.2022.03.03.16.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 16:03:29 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: aspeed: Update gfx node in
 example
Date: Fri,  4 Mar 2022 10:33:10 +1030
Message-Id: <20220304000311.970267-2-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304000311.970267-1-joel@jms.id.au>
References: <20220304000311.970267-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The example needs updating to match the to be added yaml bindings for
the gfx node.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index d316cc082107..9969997c2f1b 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -73,6 +73,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/aspeed-clock.h>
     apb {
         compatible = "simple-bus";
         #address-cells = <1>;
@@ -82,6 +83,8 @@ examples:
         syscon: scu@1e6e2000 {
             compatible = "aspeed,ast2500-scu", "syscon", "simple-mfd";
             reg = <0x1e6e2000 0x1a8>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
 
             pinctrl: pinctrl {
                 compatible = "aspeed,ast2500-pinctrl";
@@ -102,6 +105,12 @@ examples:
         gfx: display@1e6e6000 {
             compatible = "aspeed,ast2500-gfx", "syscon";
             reg = <0x1e6e6000 0x1000>;
+            reg-io-width = <4>;
+            clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
+            resets = <&syscon ASPEED_RESET_CRT1>;
+            interrupts = <0x19>;
+            syscon = <&syscon>;
+            memory-region = <&gfx_memory>;
         };
     };
 
@@ -128,3 +137,10 @@ examples:
             };
         };
     };
+
+    gfx_memory: framebuffer {
+        size = <0x01000000>;
+        alignment = <0x01000000>;
+        compatible = "shared-dma-pool";
+        reusable;
+    };
-- 
2.34.1

