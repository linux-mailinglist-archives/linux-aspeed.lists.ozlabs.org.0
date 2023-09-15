Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ABC7A1878
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Sep 2023 10:19:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dodTROZK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn6YS3g5nz3cNc
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Sep 2023 18:19:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dodTROZK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn6YD5C3vz3c1C
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Sep 2023 18:19:27 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so18803545e9.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Sep 2023 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694765963; x=1695370763; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JiFcpf2wLcf/YIfsCPE49E87uqZdxujW2soFuaVwGVg=;
        b=dodTROZKsaB57KBY6w1wEU1PnVnv/iW/OzoeTrJeKG2QcA7VUzqV2hq+ZrdM3cs+kG
         OfpymMQkpcDMXki9J2sgyLZNdxGQrltfqxO9+sOvfVlSYw8jknDRQEYTHYRpHUl7cs/b
         RBKt8uvPn6MGQRBEoswVN0DkFqHtxllgqPsgLWpjAcEr1MaTP4zS5dFnEpiwmQgp/aiH
         qhHhGbW0k7EmwCG2khRbCSsA83P3zpfwnw/cXBW2CWO8mp0UjhgpVj5LBbSeiR31jvWD
         /QLnM6zsfxfrgvrLgK9wn5+v62Q5bPo078DNf1v/XhS0pzTp9whemWzITOIwW38Hs5nQ
         PS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694765963; x=1695370763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiFcpf2wLcf/YIfsCPE49E87uqZdxujW2soFuaVwGVg=;
        b=Casz/jpeSMRSwtaKDHKW7ZbwbhojuFQDtFu+6Fm27jJWFfz6BplWtvg6eXUFXdPsQu
         SbYtDdrWwlg0+vctiA80UjWlXM2dVT94guh/fwYrUm/zlcxijhT6wRWKR6iLWBgSnX6/
         37lBp+hW93ErnI3+r1c85pcbQ+td1sCCLkKbOZmN0fnNgTpF0e5iY29dfQODc6Ydamc0
         XKIb9ymDvwkZiR5dba0177G48bTQJz5wR5nnHoR6R24rTHuPbUu9sq9zqaGOSSy+m/UO
         VlDpL9UFNB2ULgfDjcIGtP9+DA5F3y453bUOlATFZM/JBtJi+mU27y8kzr1SLDkb4/qe
         +crg==
X-Gm-Message-State: AOJu0Yx/XTWz8QqZZdFX+iib2k+MlospN8sa5jxpwTzMioeMGgVSgqdU
	soaKzLOhassRNEuaVw/TVVfJVA==
X-Google-Smtp-Source: AGHT+IFXzNFNR749dSovFhgKLlWMgw4PZnj0RueOlEVM+d1kUCki23FYGgz8dPsbomfUaXNFUXtojA==
X-Received: by 2002:a05:600c:895:b0:401:b393:da18 with SMTP id l21-20020a05600c089500b00401b393da18mr3232700wmp.6.1694765962718;
        Fri, 15 Sep 2023 01:19:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0ac400b004030c778396sm6878763wmr.4.2023.09.15.01.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:19:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: aspeed: greatlakes: use proper "mellanox" DT vendor prefix
Date: Fri, 15 Sep 2023 10:19:15 +0200
Message-Id: <20230915081917.22368-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

"mlx" Devicetree vendor prefix is not documented and instead "mellanox"
should be used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
index 7a53f54833a0..9a6757dd203f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
@@ -66,7 +66,7 @@ &mac3 {
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	no-hw-checksum;
 	use-ncsi;
-	mlx,multi-host;
+	mellanox,multi-host;
 	ncsi-ctrl,start-redo-probe;
 	ncsi-ctrl,no-channel-monitor;
 	ncsi-package = <1>;
-- 
2.34.1

