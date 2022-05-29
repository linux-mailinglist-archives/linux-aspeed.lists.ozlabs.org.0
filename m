Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D95370AE
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 13:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wnW1VhJz2ypf
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 21:10:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qaOhJnDy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qaOhJnDy;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wnL4PrRz2ypf
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 21:10:28 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id ck4so16012878ejb.8
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bs5DBrDYP0sNBpBiG9sxUl5vLBFzr14O34yIMD/h0nA=;
        b=qaOhJnDyEs6kctcS3mIPnzusmrpIIwicdocaEDl31DjnAwK97kNHZNUzdvP1LUYR3e
         NBkwEO4oM9OJypv+WKnT2k3VxCRzjHhCU4D6iERnxvX4ziadVonmv1NTYGXbVk6gRvCX
         pzepUVp/dyKcAR/9dEZeqJRb8VQLXZtJ2z4D5dWzCBq0Xgl/sP6gLteEBKMN0qa/veT2
         aFoc3OPkSXiEZUP/pWO+YvzZef7NNh8GagxM53ils7KTOm5i6XrGcGV4+OwlJ0AJ/6n3
         GIuF4NLiPLv9qD1O2HdzgtQjai/tfpVg17iq8FA4TbtV20webywr+GDLRfD4BdLfNXgN
         y83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bs5DBrDYP0sNBpBiG9sxUl5vLBFzr14O34yIMD/h0nA=;
        b=IIt6wA9doquU1wDOaHoF0kxSmTtFcwRgipwOk34XUrjS+iAVpfKfkpJXVcwo9fgZFw
         2hQR2nBkQG0kv+dXRn2pVagepuG6yutOiVxIo5VnOz38JE+dTL/ll8wWDyFH1/lPCM4Z
         gSbLQW9Jnv5p3zk982ecgL4Cx/byVTDi4JGeCZcTAjPSQ7RP7UXp60075in9hSb3r/E+
         FrazQ3nJRLkqVylkWj9Fqi7vS8fi1BYXplqLu9UPLCIdwjuFoBcENUeovOz+1uNawYis
         HLxCyUolPhBKFr8n8YdnABUmpl30pv194hFWlrbpadWNcvt/v+s0fyH/5uLZ6PyQDrBS
         qjSA==
X-Gm-Message-State: AOAM531tsK4lb39GyAZ97CEt79Fwe/yL99JzCoT83OEHDKnhfAbGIg7b
	eXl/laeiRpG6tmc10xuAyR+EJg==
X-Google-Smtp-Source: ABdhPJx+u4MF8iq6avvPhns6VVqIcAsvksAUbgN+Qkn99OG8kj9/FnVxPTJNPlV7SjkKxfcImdWG5Q==
X-Received: by 2002:a17:907:9626:b0:6fe:bae9:70bc with SMTP id gb38-20020a170907962600b006febae970bcmr35066248ejc.150.1653822625432;
        Sun, 29 May 2022 04:10:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d3-20020a1709063ec300b006fee2bdf6c6sm3073996ejj.169.2022.05.29.04.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 04:10:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: aspeed: yosemitev2: use proper "mellanox" DT vendor prefix
Date: Sun, 29 May 2022 13:10:17 +0200
Message-Id: <20220529111017.181766-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529111017.181766-1-krzysztof.kozlowski@linaro.org>
References: <20220529111017.181766-1-krzysztof.kozlowski@linaro.org>
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

"mlx" Devicetree vendor prefix is not documented and instead "mellanox"
should be used:

  aspeed-bmc-facebook-yosemitev2.dtb: ethernet@1e660000: 'mlx,multi-host' does not match any of the regexes

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

The change depends on net/ncsi change.
---
 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
index 8864e9c312a8..26217bc652e7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -95,7 +95,7 @@ &mac0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
 	use-ncsi;
-	mlx,multi-host;
+	mellanox,multi-host;
 };
 
 &adc {
-- 
2.34.1

