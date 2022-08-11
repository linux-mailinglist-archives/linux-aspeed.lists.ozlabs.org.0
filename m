Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2826F58F7A6
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Aug 2022 08:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3H3p0g6gz3bYk
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Aug 2022 16:30:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mNSc65BD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mNSc65BD;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3H3h5znpz2xrj
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Aug 2022 16:30:06 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id bq11so24299802lfb.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 23:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=BS7WiKUMDJtqRQ5dZPQX1Kag33dxq6eXqVD8Yq69pIc=;
        b=mNSc65BD+CAL1tml5NGK8iucFPEi60lqoQn2TO+egP+A5rAvtsix6Ma3sY4kp9C/4j
         NI/FtIyoBq111krvojdySC3e4cd3/xINNR6UH9tlc/gsz+YMm/IRD/zzJrglYirRrOIg
         BYTaOXe8zczKYkdZIiJmUqU1SXIBJWGSX/UCJjNC0MyErlZWn2E5ms/dD5zEKhxv4Y+o
         H4SHWxi/AmpK4jS1IaAIVwQyVXxRifEnGHtLfE0Fp7vT/EZOgGMBMHhl0eHEPku7/pps
         01jaJ5XbK98MiAvN0HhT01ho0yIhy0pZYgSEILiWlelgOOwf5rJo7rggcGzUwKI8Iwq4
         fTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=BS7WiKUMDJtqRQ5dZPQX1Kag33dxq6eXqVD8Yq69pIc=;
        b=DJ97fjzaotBF9HsDrNramulNIa6pj6F8g5OKn1ByZxrXZUymh48cpcKGPpngErIgtI
         7EJgBqr1+OYA6LQtWxLtksnpbN8qbYOumJ8otf6aQ5nxwXpjRbGg6KWyhRQn6zmNoc38
         BV5g/rhGSpge4DDNrrAAEtza3vLuUsq398UMBs0oJBggWDkjVHVNNxcEHCNw7BdsDn4M
         qsDwIYaPIUmgCiwKSul6idhpSqKAcfL0kC8NctJvEgh9Ea3MVGT25GRuWuhRme+yhjiw
         7vFh/BpAFPRKMs1P/v2YWhM9mgcbFfAuCtzFmnRd0hAJsWhDXwTnQp1kVnxSwO+gzDNW
         yfBg==
X-Gm-Message-State: ACgBeo0x7GPt8ib7gEOryq7CgyYtgNFlmrDY6A/LTqJDgpvrfGzAiEQu
	sCkZjrmTjfSWkgqjefte50kRJw==
X-Google-Smtp-Source: AA6agR5xl0KEW5jJiLilbSsgZqiE8poyvn0jS2roavqo2h1yQCCZo5MRUqcvXFQk6AslMlti5PVJmA==
X-Received: by 2002:a05:6512:3b11:b0:48b:a9c:c442 with SMTP id f17-20020a0565123b1100b0048b0a9cc442mr10652863lfv.86.1660199396729;
        Wed, 10 Aug 2022 23:29:56 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id v3-20020a056512096300b0048afe95d4d4sm597752lft.17.2022.08.10.23.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 23:29:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc compatible after rename
Date: Thu, 11 Aug 2022 09:29:53 +0300
Message-Id: <20220811062953.5976-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The Nuvia DC-SCM BMC board compatible was renamed in commit
7f058112873e ("ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom"),
so adjust the bindings as well.

Fixes: f77024c80147 ("dt-bindings: arm: aspeed: document board compatibles")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Fix typo in commit msg.
2. Add Acks.

Changes since v1:
1. Use proper qcom compatible.
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1895ce9de461..4f0b308e9f0f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,7 +80,7 @@ properties:
               - ibm,tacoma-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-              - nuvia,dc-scm-bmc
+              - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
           - const: aspeed,ast2600
 
-- 
2.34.1

