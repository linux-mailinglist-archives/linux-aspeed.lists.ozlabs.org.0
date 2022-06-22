Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF293554535
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 12:18:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfVS4dyZz3cJC
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 20:18:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PGx+Ahz1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PGx+Ahz1;
	dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfTR327pz3f2f
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 20:17:47 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id cf14so13434442edb.8
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 03:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DQPzhLkCcJI8ldGFjIADNQSWV6EO/+ffmPDrz1yeX30=;
        b=PGx+Ahz12NaRmeCr+O6B3+4SkuZekFVrMgWXLrvClujp6p4uz6e5KJLpNskB7H9VTI
         Mr2vRO9JMOba7JS2RgS+aoRDrU0OKkiaK6VOTFdUzI8bXlkc+a72jpJu2DnEqdTzQONi
         uddKlIavldLx/OPlnYNXtJU35UIs2kMECZYhJsEAO3AGgc+RfSCQ5ccsl8vz5ZEMk2Ws
         CiAtNIwM5Z+LoaBMRL6noPvJsWaq3hjl6XOFDwEyssECJlA17SjtRXzz85I1okmRH+mT
         k7UItd/agz3gkBZsygAWGeirEdxjhU4AOFSQ7GgcZVrkcz0m18Xiqk8CVMSLV6muI1g4
         /mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DQPzhLkCcJI8ldGFjIADNQSWV6EO/+ffmPDrz1yeX30=;
        b=X76lrv8tzfQhUuV/kwNCdLjBT0tpRqKF6+oIItddm5itW2EQtpO1u6rbTU8WtPNh25
         O1fTj9ms0bo8kTiSK0Zn5LWv/Sh0Nl3YH/eX0Au7gaeQOeTOyKA5B755MrNzbSGkhLOq
         t12fOMQml6UOLn0i5oNBzZtYQihwC09etYg/FhryG7rMmKI+C6UZ2ClJIU2nS3PgQ2WS
         ENc1FJPvL7iPLxhaOYCq4H73y3IgyhGxexW5gEYTuXq+1q1XbBgRjVFBQ/JTEyb+OAL9
         vKzj0M5aR5y5YniTVKA2uP2RmjuKIQRmJE93Y6iVA+7n1J6ugnNj3Z45XZv2PjyTIMby
         IsZw==
X-Gm-Message-State: AJIora+R3RtluIXX1OCgy7R3TSucSq4D1O4JD2YzXYEKlq1TDwQQKl1S
	B8rrlOLb7efhFFJwnpguJ3B1Gw==
X-Google-Smtp-Source: AGRyM1tsEWhNXd63w2o3Kp41hvPXfubp4BEke76zLyoZkQZIYZom+EPX59smbU4/AUkHkbRmZgW3Hg==
X-Received: by 2002:a05:6402:27cc:b0:42d:de10:4b6c with SMTP id c12-20020a05640227cc00b0042dde104b6cmr3361673ede.424.1655893063381;
        Wed, 22 Jun 2022 03:17:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ky4-20020a170907778400b006fe921fcb2dsm9028707ejc.49.2022.06.22.03.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:17:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: steven_lee@aspeedtech.com,
	linux-kernel@vger.kernel.org,
	andrew@aj.id.au,
	joel@jms.id.au,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	chen.kenyy@inventec.com,
	linux-aspeed@lists.ozlabs.org,
	robh+dt@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH 5/7] ARM: dts: ast2600-evb: fix board compatible
Date: Wed, 22 Jun 2022 12:17:37 +0200
Message-Id: <165589305701.29629.16558823726381499116.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529104928.79636-5-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org> <20220529104928.79636-5-krzysztof.kozlowski@linaro.org>
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

On Sun, 29 May 2022 12:49:26 +0200, Krzysztof Kozlowski wrote:
> The AST2600 EVB board should have dedicated compatible.
> 
> 

Applied, thanks!

[5/7] ARM: dts: ast2600-evb: fix board compatible
      https://git.kernel.org/krzk/linux/c/aa5e06208500a0db41473caebdee5a2e81d5a277

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
