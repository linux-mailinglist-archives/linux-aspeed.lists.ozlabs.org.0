Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA7566A17
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Jul 2022 13:46:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcgqC2jKpz3bwg
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Jul 2022 21:45:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cim0tg3i;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cim0tg3i;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcgq25gsBz3blh
	for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Jul 2022 21:45:50 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id t25so20078858lfg.7
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Jul 2022 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=saFvUNutIkwJIKsbwz8el/rLQChL+0J42iD0Z120Xzc=;
        b=Cim0tg3iFz2KhUJTKw3IyP80HUNfdvp5Agu8fvMVkk1HcwZhott9laYab/fNuaBCGa
         903nQG8cEHoV61S2FQ2hdCw6aLoD4ClzIk3+FOLWZKt6FuySDmVlpjhhVKQO38SMB/2H
         fJduhDoF7T41KrGkj8kbaEOTPlWpiI69h3frLX1MD18LbaTZ129W1ymX5aVSyWa4OtI2
         IhhES0TJq23BuA9ipFDUTCcZddCU6oF5SHPIsXsv/MaYTouo64/JwVKGiGG9k4FA0hrj
         b643syRu+XZjy/ilRtfXetpxM/pKbvMLoCmLolYDI4v54wbwXUn1x2/848H6XbPwdxzT
         7W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=saFvUNutIkwJIKsbwz8el/rLQChL+0J42iD0Z120Xzc=;
        b=VhZV9esX+5ezB6GWZFL+HZZPpBrmaSqw6h5tDggp6N/Lb7NOhiuDqqIjxP6ht9ZJz8
         zUfTGbckmVQoNJ3zN/FcFpeSgE3N2F88iT0XYl5G0RqXziCiCYHi7naCe8tUPVcECMTW
         AB2xjrjhJr0p8HwvhrKhbC9S2obGNCdEs73N8QqIry1FT0X1XhdMcAFR3nfbvVoWngDY
         rgXs37pApBO6/+XrqInzax4jQ+64kXrZ9UYvUnv2W9bMViQgfTBzxA+ohkZ0f9Kt9OC0
         puZ38G/HtWUQWISMAJfTrZcrOZT3xhc7yrtIUw9yefd3v/DHi3G7OH5dIRwE9Dk5KyGi
         pFfg==
X-Gm-Message-State: AJIora90BfIm/URdpwzObjw1lpGYhe6ObkvgMnKyPzr2vOVWHZm95GEl
	W0Jk+v/DTI6CmY4xLNv+bz/o9A==
X-Google-Smtp-Source: AGRyM1tuXKUJiOGHda53Ozd2LS6VSQPa3uTR2aZkiqj9hvpwiZLHrKaLXbCvgJN5f2K1LhTPfr9Dhg==
X-Received: by 2002:ac2:4a63:0:b0:47f:9e6d:603b with SMTP id q3-20020ac24a63000000b0047f9e6d603bmr21856388lfp.404.1657021547120;
        Tue, 05 Jul 2022 04:45:47 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a12-20020a056512374c00b0048137a6486bsm3543694lfs.228.2022.07.05.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:45:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: olof@lixom.net,
	krzysztof.kozlowski@linaro.org,
	arm@kernel.org,
	andrew@aj.id.au,
	soc@kernel.org,
	joel@jms.id.au,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 37/40] ARM: dts: aspeed: correct gpio-keys properties
Date: Tue,  5 Jul 2022 13:45:43 +0200
Message-Id: <165702154046.92998.13819034081421883351.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-37-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-37-krzysztof.kozlowski@linaro.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jun 2022 17:53:30 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[37/40] ARM: dts: aspeed: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/bafd5bb5ea496c8fc443e6b9de70af840bec0b9c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
