Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520E5E5B73
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 08:35:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY5BZ0mbCz3c1c
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 16:35:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n3xOBDiv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n3xOBDiv;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY5BR4TzGz306m
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Sep 2022 16:35:25 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id z25so13073104lfr.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 23:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UG9ohaYNGjC0P5to2hQtJ2st/GFJ8zFpPwv7fQeTI1k=;
        b=n3xOBDivLy1P/8Qh+2k2b/mOB3/VRhF473LRc4JGPdzNBlSF1OkbJ39YpcAVU46+4O
         e4mZDBFykkFRfu7cchV5yKHAbpd4X7WoYgGZQfL/s7JC3M6pP5SJMUsXkppM5rOE4qdB
         aPsPaVBhsXXDQ4NzCKjQquB4uR20DOepMSCgX5CNGwcn6S1zQp8b8smzPKnvzt7VkrlY
         HClXXM9LgJVEffrwYuUepFu5hRDt+orUHOgE4D/F6R1kspEYuEcTRENkRa5ngZm8zo3R
         BqJPAebADqZ0IZ6HJ5ME+ChcZPMayp9mROGN8r1zZ7/xITDNkmVxFM8oObuleYv+JYbN
         wc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UG9ohaYNGjC0P5to2hQtJ2st/GFJ8zFpPwv7fQeTI1k=;
        b=B60OXo+esgtAInkYsMFpA52P9R3jDgk2XHrz1WHWbpjwaManF4p4ViybinK5pzOx/X
         RId0zBoC8p6R+794zwfc8fjPumd5GTAKXObgWDg5GETN10WO7hRJkkW1q0C9DyqST2zT
         hI/lD96kJGh6qgHc4NnEejm98cYqJ7VghiWKYflzJrkWgUeD0f+9a49cyix73/2nMl1e
         A/ROu9KtM/5avWknh6Llxi4LrkShxJ1Dl/E0bdEyYtrxjQ7hXTp3xsKZICOTM5WVOVUl
         lzc8joDKcR+bhmhQ6RdLjy6gdzT+7M9ayd0HobDr/xiVaiTV5gz+eWY/UIIr0y5rhiUS
         cifQ==
X-Gm-Message-State: ACrzQf1jEcCYG1kj7h6GalnqBXN+yf1g5E/2VFOd85Wbha+6TWXh9Pw7
	vVF8jgP7Xs5aW9e6e3mNOstYuQ==
X-Google-Smtp-Source: AMsMyM59bw9pdu973etIE/LLkjusQ6+VNSmZkxPOGlt5AQZzoXXZEBZhwZRYoa3QPGWJREsy0jV1IA==
X-Received: by 2002:a19:e050:0:b0:49f:5464:71d3 with SMTP id g16-20020a19e050000000b0049f546471d3mr719382lfj.558.1663828517506;
        Wed, 21 Sep 2022 23:35:17 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eb7d6000000b0025dfd2f66d6sm745682ljo.95.2022.09.21.23.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 23:35:16 -0700 (PDT)
Date: Thu, 22 Sep 2022 08:35:14 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Message-ID: <20220922063514.f6euqlw35jrkpee4@krzk-bin>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-2-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220921210950.10568-2-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 22 Sep 2022 00:09:46 +0300, Konstantin Aladyshev wrote:
> Document AMD DaytonaX board compatible.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1680833


/: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dtb
