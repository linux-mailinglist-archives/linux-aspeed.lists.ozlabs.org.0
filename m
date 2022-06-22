Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB483554530
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 12:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfTP5RPLz3chL
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 20:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q3/SypPg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q3/SypPg;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfRZ4H92z30Qt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 20:16:09 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so524928wml.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PV5l/qPIaVc2UdGzPYXAFK1SR2E90ae569+VbL0JX38=;
        b=q3/SypPg2Bx+EDeFhgEN8xqA9rbU32McCqgA8rtBXGJMnukSrlhXbn9YM6cNMAtcms
         Uif2w4FtkaBR/nJd2jdro7nEuuykFe6OJB5cvt1460qfjyXQ6KNIY8A4FQpdvowVj/kd
         HoFwIAEg/fZG9wxCc2zP7l77q1eqcMS10p6IgK5LYtYOAR1XcLtyXVaEwYjBABOOlxdo
         vU8MyrsOjEL41Nzh9peEr/b/impPpV5+SOMsYcPC7EM8jboen0Gy8w823SMnfMptHiNJ
         5VBLx2kCvVbr0A4ROZTQvPFU5SktGVy0mjYYNPBLpdaoQAwPpV5iOj7GGilV5Q8uJ+bn
         g4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PV5l/qPIaVc2UdGzPYXAFK1SR2E90ae569+VbL0JX38=;
        b=prXwuleAC2JK2lcCUDJx7WMZl2wXlCqjc13TqxBTYyel2Qv+byTNzx9s9SN0AsG43C
         6u3EmIkMGxfN9V/1GOViE3WcM9YPDQfe7uEveBfGQgLLnOXGR8BOvNxzTJYy9dU7Ges6
         jq7Q9CfbfdycNL5fgJGl317URiHnAQXMfVQruorBMg1Co0bcjugUIlzpELLDc/bspBLO
         399E2ggO8TCK5Axfqct2cusdaG6IMTmrLTYV6pJGfUI8uAAW3FAF/XiHMViC8syv77yM
         OdcbthjdP13gyjtm2dhbIvzJ9e/opm3NRs4ffkVv2AIyWUw4oaPbvCSruZrt4GUbFvED
         T4dA==
X-Gm-Message-State: AJIora/TUeHVxcqSMRuwJtwjlt7kRW2aFBmDmL4cEzM5mfeVUEQ31i8k
	QIB+CDTHVrWYrnTuYfwpQbVU7A==
X-Google-Smtp-Source: AGRyM1sgXQCS7RfXwY5oOIAiqhuex4MXD0de1ceeGIuv/RbLW4evLvRCPWDYHJz4sMFioAelRYKuqg==
X-Received: by 2002:a05:600c:ad1:b0:3a0:2b9c:e46e with SMTP id c17-20020a05600c0ad100b003a02b9ce46emr1704522wmr.29.1655892965648;
        Wed, 22 Jun 2022 03:16:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u3-20020adfeb43000000b0021a34023ca3sm18460269wrn.62.2022.06.22.03.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:16:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: chen.kenyy@inventec.com,
	Arnd Bergmann <arnd@arndb.de>,
	joel@jms.id.au,
	andrew@aj.id.au,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	steven_lee@aspeedtech.com,
	krzysztof.kozlowski@linaro.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 3/7] dt-bindings: arm: aspeed: add Aspeed Evaluation boards
Date: Wed, 22 Jun 2022 12:16:03 +0200
Message-Id: <165589296123.29026.15593062333148193999.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529104928.79636-3-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org> <20220529104928.79636-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: David_Wang6097@jabil.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 29 May 2022 12:49:24 +0200, Krzysztof Kozlowski wrote:
> Document the new compatibles used on Aspeed Evaluation boards.
> 
> 

Applied, thanks!

[3/7] dt-bindings: arm: aspeed: add Aspeed Evaluation boards
      https://git.kernel.org/krzk/linux-dt/c/7752cf2fe2d533c7558423c9fdda002bf0fa6476

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
