Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C36B5473
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Mar 2023 23:30:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYLNQ5LQPz3bjk
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 09:30:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aAN3J7ps;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aAN3J7ps;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYLNG5L1tz3bck
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Mar 2023 09:30:20 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id x3so26402102edb.10
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 14:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61DvhmsO4xSNuNORHw5ib//2wHgpkfyqFxtOWBFNJmo=;
        b=aAN3J7ps3GBSOD08xvYIioPIS7Z+DyEdXyhKpTgdWiaio98OS+NjpoqRhFy/aa1Uc4
         /nUwOyqfXMQiTIfShuaZAG3QBNVdNYWPfYyg+YUOsYb2MfBIvteHxewDJBSNzNW3JhjP
         tDsj59shgVnWSS3HxDq4UvVOuDTPRbOtrxvz0bnEqka0mFhCpoUEDSJK0D+OK4TY5pWv
         UsV7UX3oh8t+YCHsh8a+qF2tjbg1h8f6HrdkrOm1WKXAsPJCOMjTYTFrNf3ZBtZrGCey
         z4GO9Q08HD9sWTfbEgm8WpzKplUlQOgHnaOsoZkhiIJ7VaBA7fY+sSO5coRF+uL4h2AW
         LMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61DvhmsO4xSNuNORHw5ib//2wHgpkfyqFxtOWBFNJmo=;
        b=f7l8LyCJ+FH440hteUD8SNMYBWnQ4MHffxfmzbvib2iaeYTJiRRy2GO0rNESakp6tL
         Mz7V+KCNgvZb+pueGTDbGQLmLrV581Ip1llIyeXc42/yRQNsXibm9zUsVksGIcNoy9cr
         DtQuwEMpPWdU6TmBF6qOfn421IZm7RS/oPhdEoQ9LsDPSQ/aHCx52PfxnzBG0ju5owfw
         E2zFz5qlLeX1S+UvD1JBmzuAOYebX4bqnkaLGMqXYlsi1OL1Bl6qPFTM1hiaAG8YrbG/
         85zv/H81wZR4ZRcpCWtKt1jpXzq4GXmxKoc3WC/badTydymzDAuGuKdvYH11yl/tZDVe
         c4iA==
X-Gm-Message-State: AO0yUKX3tP2HLz7jVwHNVYVePGU6PWrNW77kbCmhcTNetc4qi/4BiVXz
	ZrWvYaIdAHsg4QX6cl9oOgubIw==
X-Google-Smtp-Source: AK7set8IwF9MMOqQdMWkdrh2f4Xq9KnkoKxFJPEe/j1hoU2JE80HulHxMpzUaPXGKchFiqU+1e16uQ==
X-Received: by 2002:a17:906:434c:b0:87b:6bbb:11ac with SMTP id z12-20020a170906434c00b0087b6bbb11acmr26776453ejm.60.1678487414349;
        Fri, 10 Mar 2023 14:30:14 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id ht21-20020a170907609500b008d57e796dcbsm375533ejc.25.2023.03.10.14.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:30:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: aspeed: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:30:12 +0100
Message-Id: <20230310223012.315897-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/watchdog/aspeed_wdt.c:56:34: error: ‘aspeed_wdt_of_table’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index c1e79874a2bb..b72a858bbac7 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -465,7 +465,7 @@ static struct platform_driver aspeed_watchdog_driver = {
 	.probe = aspeed_wdt_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.of_match_table = of_match_ptr(aspeed_wdt_of_table),
+		.of_match_table = aspeed_wdt_of_table,
 	},
 };
 
-- 
2.34.1

