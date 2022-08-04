Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6807A5899E8
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Aug 2022 11:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lz3Kk2FNHz30LR
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Aug 2022 19:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DSK+zIe+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DSK+zIe+;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lz3Kg3VWzz2yn5
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Aug 2022 19:27:35 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id x39so20373926lfu.7
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Aug 2022 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJotf0HZBChiqOdSpVJcpoR3PKqFSTdoHnx5y+sK0/0=;
        b=DSK+zIe+VEWbWa1wiAKrQxddLG3z4XWvG+XYGyfbk3A0rusyYZnlbyrHEb0BhV8+wD
         fyaGTI97X5R9hyZEfG9oFO83WDKRXBjvODa9QPYQxLtB9WWoW412QOSOqb/fWAIYWo2A
         3Z0rFddpnFhETHZVEqstzlmBf+D9gcZCdzfTaq+XOL/8KSClU2KSLMQjMsas/QqN0nWX
         D4XLDHWRWxtWJ5iZFVb9r3weaIe5X/lgxLJJ8yAXrxvUFe0+NqyEJNBMCrLdMU9f4An2
         hxnAEvDJHdj6IRL8uF+9og4HbHjZDi5TmBbFVg4lmYouhrt4zoLfGmEy5McU67T9yng3
         IuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJotf0HZBChiqOdSpVJcpoR3PKqFSTdoHnx5y+sK0/0=;
        b=gZPTDDp007ncCHkzQydgW4dPfNiz0Q0f/ual4kvrHcALW4eoiSjgIGH5PQfjXCxcQ4
         ymVJmCg4EX0ScqdPpBdx95FD6Ys28smDyV+MXl/zwi3kE+FzgEMyiwuQ4y1OURYWIzBY
         up3zfFNvifvjZ1VherhVzI8OFbCFc7avnnkcBQZ1kwaQNMEjvMHeCyPEK+UfjDAaWSJo
         vV4hWM1Iwmuu4tnfIgG1nhUZ2rgHuPpl5u3yvEJyezbBwIcgm9I12t0/bLj6wKJ5+7TO
         Z4njzdt4u4oWoQC4z6PBnO149lWS43T4HtlnXVZOFXo8x2Q+/1C8JLN1Tbg+Q3iP8KXp
         9npQ==
X-Gm-Message-State: ACgBeo3CT7XOqcltVZlWdJixc29zOVjg5rRzEksXP58srlMFXl19lgA9
	QCijLRYUPkToEUcYXJfYeOMMxw==
X-Google-Smtp-Source: AA6agR7mBuWmXmnE3pRiVNzwdYq9T871uzpNb8JjH3t051iQCWBIBId1ePt8fD9RVD5LslkMQDfMxA==
X-Received: by 2002:a05:6512:b82:b0:488:6aa6:509b with SMTP id b2-20020a0565120b8200b004886aa6509bmr418657lfv.637.1659605250897;
        Thu, 04 Aug 2022 02:27:30 -0700 (PDT)
Received: from krzk-bin.. ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id a24-20020ac25e78000000b0048b3768d2ecsm59623lfr.174.2022.08.04.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 02:27:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: ast2600-evb: correct compatible (drop -a1)
Date: Thu,  4 Aug 2022 11:27:27 +0200
Message-Id: <20220804092727.64742-1-krzysztof.kozlowski@linaro.org>
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

Due to copy-paste, the ast2600-evb and ast2600-evb-a1 got the same
compatible.  Drop the '-a1' suffix from the first to match what is
expected by bindings.

Fixes: aa5e06208500 ("ARM: dts: ast2600-evb: fix board compatible")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index c698e6538269..2010e3cb6158 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "AST2600 EVB";
-	compatible = "aspeed,ast2600-evb-a1", "aspeed,ast2600";
+	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
 
 	aliases {
 		serial4 = &uart5;
-- 
2.34.1

