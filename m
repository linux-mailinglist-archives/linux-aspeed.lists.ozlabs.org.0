Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70415554523
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 12:15:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfQC1fj0z3bq3
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 20:14:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yoiHxxi5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yoiHxxi5;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfQ505HJz2yLg
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 20:14:51 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id q15so8935594wmj.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GVGI728rV0ZlRWovIbavmx1jiCPdP4ulmg/ao4WGVQI=;
        b=yoiHxxi5Fr39G7nZrf1FVVgYDNTvIwZpMJLS+6LkGjtzOAHa52SoGoig5UatCG/WTK
         WXVfxU968FGk6TWEYWrDy7thi3ufeC9SL20xOaupG3Rn9Zouk0rhJ9Mt+OwkFzvLymap
         MDFLITscxmWMvMFWXc8+aUx+i6uU6AWnDQP/WDoPYW4aGadGnMjowqREx31PLALojP+W
         bNYEmzDzeUmqLzGlcvp7VGjZyXUtuoW4SqE3X1C+sdWxxX0IAmNSobDJ/Jb4IQUR7fMJ
         gCDbxw+fT7sMu+lnGjNptk/4Eiq3rWtKU3zV175CjeJmSpiz7PEQkzSOYZxK7daINu61
         oIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GVGI728rV0ZlRWovIbavmx1jiCPdP4ulmg/ao4WGVQI=;
        b=7GpOiUQr0/8kHw1isnaJ0TjDkkiLYt/8OTtSspfi79QTQPzDRqPcPrMbMumgZFzlJO
         4LPUV59pziUQi84f5Ux6D1gmakeVDYJV4OrPD/io+sg1v1iixIF6pYzUzb6wpLQZC+GP
         C6Gn0TCuOk4jZ66zyRQvVpjB4nfOlbFcfh6Reuv8ByokPeFIdFqHStRbHIfF5QdEpvqx
         IStNml4G6ZdAT3X3367EwoRsii0xmtVRVQOsfUvGzU8q1vh16PJWbvtv7gT3N7qcBZS3
         6++ejrH4J5BQhFzgEZTB0mQDruRLlW5oxKhKQE5TwARd1JEzW9QcVqaKz6t66ZUEfJf0
         57kQ==
X-Gm-Message-State: AJIora9ObKHsaMXUCmxpnL+20RhQ8oZiKR51qhqINCKJmPx9j+wvWtqX
	ei6xGJaNnntkwCYwNkXxk88aDw==
X-Google-Smtp-Source: AGRyM1uWZMKFzyzyVi3Mcy3CPedN1dz613U3U0JixHOgaUFg8RD7jRt6Bu0VCBWdyY2qNmAVJTIYcA==
X-Received: by 2002:a1c:4e15:0:b0:3a0:1990:afeb with SMTP id g21-20020a1c4e15000000b003a01990afebmr13313618wmh.137.1655892887112;
        Wed, 22 Jun 2022 03:14:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w5-20020a05600018c500b00210320d9fbfsm22184549wrq.18.2022.06.22.03.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:14:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: chen.kenyy@inventec.com,
	devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	robh+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	steven_lee@aspeedtech.com,
	andrew@aj.id.au,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH 2/7] dt-bindings: arm: aspeed: document board compatibles
Date: Wed, 22 Jun 2022 12:14:44 +0200
Message-Id: <165589284658.28441.1588047978357747292.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529104928.79636-2-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org> <20220529104928.79636-2-krzysztof.kozlowski@linaro.org>
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

On Sun, 29 May 2022 12:49:23 +0200, Krzysztof Kozlowski wrote:
> Document all compatibles used in existing upstreamed Aspeed AST2400,
> AST2500 and AST2600 based boards.
> 
> 

Applied, thanks!

[2/7] dt-bindings: arm: aspeed: document board compatibles
      https://git.kernel.org/krzk/linux-dt/c/ae8980247d5af8528145713e07f1338abc57a00d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
