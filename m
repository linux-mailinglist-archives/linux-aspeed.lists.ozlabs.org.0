Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FEF95B690
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 15:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqPBf2Kncz2yk7
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 23:27:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724333239;
	cv=none; b=AyEbvZyPT3SbKyHz3tqeONAbVc+jnrP0XYN6rpvymVQTEwmEcCX0rUqBlWpXh7akbGYPlaTrGbESt+MLVMwe4ZS6XZcBBa/F1ojOMAiDp0lO3WtKnvkp6YN5bKPBgLTtRyo2p9HAL/QZAKQ7ux/KBk9aOdHl6sdU6ByOUFYsVLY4jyx1anAGLao6D0NqCqL/zZURDMmV5r9E8HGTiY+sZTVz93ZmmKXZOHlDZkSpFr7N19jeKH5iTkOp1nRZ8TGkNvjxWWk7U6FZ5X4MxOu5ojjBxHWJw6q2+TfCPzkjV/SSWv2wb4CN0LrsQ9mB2CUE0RxZ3+n0ztwJA+zmsx+tIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724333239; c=relaxed/relaxed;
	bh=heGIarr05MZ0K7mmp6CHQvn8aVfPPIQkNf3ZJw1FViw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=OFORF1BP+/hcVU2T/CNrHgm+zEJ/F3aDUCGUMu+U+Iw1oaRtAFxRJyK26+D3v+5qGr7qIMKNQNbsK6rPVNGvkQeYUV24PtlB9GbQUr+IdMs8oATq8kEPmgObnghIkgX9Fo3A+PpJwyBKZrG4X9cskcYdmPZRj377taGIki/zvI6WVUMY4SfbJbQTNAXbdhxy92auvRcDHSzH3CNyYjxHbdrzz0BsLBAqJUA7BKGRXslCvFxBOLMoqtWk/B+4N1Kx6Bx/ENalCLWdS+vr732wiAMVkQuBlqrgd9PhxVBNl9BcdOYO+MqHiJn2tA2zm8uVp/2fbfDiUbFDRDDZcUn/Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UNjurbQj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UNjurbQj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqPBZ5z2kz2yV6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 23:27:17 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3718ea278a8so143090f8f.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724333232; x=1724938032; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heGIarr05MZ0K7mmp6CHQvn8aVfPPIQkNf3ZJw1FViw=;
        b=UNjurbQjGMq/nuy9PMJRCKbzfClVrdOqgS+1LWBo3wWv9/OnmBbkK+StqGu0bTOD4x
         p0nIXOxwu1tMjFcGsER9j0RQvtJBpThgMYPqayT/WaSHDgwrDA9sfFTt4gBsJSA7MS2o
         Sz9czRI8LZmnxsYr1/m1e6QDcGaHemfHGg9SBZvlisiloiM/Klt/xTtUncdDuymaOQxV
         XK+ulNpzk/jgFfwRF28xXegXGkYc4+nHi38XWx6M1Zbzj9kt1OiLWtgqBoExsHcjL3gq
         numafZ15QJs/UeZ+5Yeaubt4TkzGSfLCmmPWbYPwWtRPKspiLqCfdlZCzCSTo1SF9bey
         gYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724333232; x=1724938032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heGIarr05MZ0K7mmp6CHQvn8aVfPPIQkNf3ZJw1FViw=;
        b=JL/3RB/7iS9p32+gixfByJTV5PGX0wtp2K1rPQ0qkoRmpVvRmFMf8hTzZTiansVB1l
         CItfcehoNAGRwaRKirakOb7AuNn+DPT2wnSbUZBmDD7VpbabkeFO12TRzrGKiFn6+mVH
         rqQDgdsbYCCXnobheMcbWcrhx3DZkQTtwn5Hl/IOY6YefFjl1EPSq0+WzDpjOIlMZJW2
         rg0XA3N0HV05/DE1y+PrZfr7Tc8S+hPR/Mbc1Gb7t4khvWhSwoVdnFp/I8R/yx+kIUkW
         uf4uhbCNKrSSglDfWqRK+yPUpNeN5WEa+jP+CToE4oTXxWX3wijWykiT9Kfz2ZtWRbn+
         xtwg==
X-Forwarded-Encrypted: i=1; AJvYcCUeH0dqWCR6RhfuWnzaFmcClJt8xoJJWnkMsSydjqfXBfBjeioO+Wiw0wpTLPOitLLwr1U729UxLaXGys4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVzH157B2zyZprACJCa/+tDdl8gBHzUGFTB3TrlYgTtwUg8aEv
	c7G+urJA5StIOlAbtYkvnip7TN1CIqCHRbqL9OiD3fUbcGPP4CKFN034GiGLaKw=
X-Google-Smtp-Source: AGHT+IHnNSVQHM2d9IRfmql1uFIKdsWiicdATDg1EWg6EFTqcFXlV2endQY0D9GvUsxJ5J4dgUJ6zQ==
X-Received: by 2002:a5d:6d89:0:b0:364:8215:7142 with SMTP id ffacd0b85a97d-372fd584d52mr2486942f8f.1.1724333231717;
        Thu, 22 Aug 2024 06:27:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730810fb6bsm1703531f8f.21.2024.08.22.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 06:27:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rayn Chen <rayn_chen@aspeedtech.com>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: aspeed: drop redundant multi-master
Date: Thu, 22 Aug 2024 15:27:08 +0200
Message-ID: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

'multi-master' property is defined by core i2c-controller schema in
dtschema package, so binding which references it and has
unevaluatedProperties:false, does not need to mention it.  It is
completely redundant here.

Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Reference:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml#L114
---
 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index 6df27b47b922..5b9bd2feda3b 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -44,11 +44,6 @@ properties:
     description: frequency of the bus clock in Hz defaults to 100 kHz when not
       specified
 
-  multi-master:
-    type: boolean
-    description:
-      states that there is another master active on this bus
-
 required:
   - reg
   - compatible
-- 
2.43.0

