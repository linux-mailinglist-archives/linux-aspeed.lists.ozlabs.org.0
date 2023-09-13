Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCDE79E1E1
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 10:20:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dDNAdNrh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RltgQ1MGSz301V
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 18:20:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dDNAdNrh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RltgG2C3Dz2ytp
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 18:20:24 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31fc91d5ca6so282134f8f.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593216; x=1695198016; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ebvh+OTfikZSo6LNSB0uDYGYHPACmUNeRrjWJEfO/Vo=;
        b=dDNAdNrh+UjiJ9m0TPt0KaLRahoNX0kpN3DrZnavyrEGHAAV8jSwYP1ONzK3/uW1db
         7yTvRkme/W+StMRUx+adlM+wa6vtjqHLQGcjCqSKULxaWyvy5oVsKFHxoHC6kXUQEull
         drBY6L/BftaI4gsYxu6NRk8mXCfd/fal2uNCAarrDwaEYqQ1qKH1j0OpiXS7LS1FD3Hs
         kiidt2gsCVvjPqT9s4ciiTxTetrmaFQ/o7rn48/27lEdF6FPUYWCioYBq62DsF7DZQ0B
         yh6tgiAjgbCqi2qMejcboiRnLnHK91FqVPJFCTDEG6i0QA7yggLd9A+pvJorVFsOxeiI
         ohnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593216; x=1695198016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebvh+OTfikZSo6LNSB0uDYGYHPACmUNeRrjWJEfO/Vo=;
        b=WdaOq8WDE0X5oWbHvRvYgbyStxuTS8QqjD+qXhzdeGizMql26vhiupEFZD6U+SJ+5L
         6z3KN+EM2lG4SbrXD0sOztybGUjT0pORrTXN0h31+Z/xzFaViq2WK5SeZYFZ4edWJRoK
         UKRF2yZEySHyXuSSLnkBmp1uuXueQBJNktaeXzMHVn+MYj3OCJ2YakxQ8zqO66NEog2t
         AouMxXqgUHSxfC7P+rGzYkFg1uQjDvwsfWmHHCgR0NnPbg9OlET5UkczsbMmQxB7tetw
         mtRRN5cRDrfhkTePev7xDaTd8y5d/k+htdeThRSIJ2R825gi/iXwxC/aSRkd/FuL+yIJ
         SHiQ==
X-Gm-Message-State: AOJu0YzHbyRTIfWDj5lduK3ZKdNOkLvJfioSJ3uNYUEsbpJZ52PjhBe6
	Qr1J+rAe2pi9OHjVzVvSqsqnAg==
X-Google-Smtp-Source: AGHT+IFGi6oH48U1eGwPJWFX4hkRGcYm33xyNRCZXrFRAn6W1yz6600EEf+4osxfcjSoXX3qS2aM9g==
X-Received: by 2002:a5d:4c90:0:b0:319:7a91:7107 with SMTP id z16-20020a5d4c90000000b003197a917107mr1271860wrs.48.1694593216285;
        Wed, 13 Sep 2023 01:20:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id a5-20020a056000100500b003143867d2ebsm14844756wrx.63.2023.09.13.01.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:20:15 -0700 (PDT)
Message-ID: <26a53f62-d8d0-9583-e675-a3db99c60c8a@linaro.org>
Date: Wed, 13 Sep 2023 10:20:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: document board compatibles
Content-Language: en-US
To: yangchen.openbmc@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-2-yangchen.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912140532.3797736-2-yangchen.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: patrick@stwcx.xyz, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, Eddie.Chen@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 12/09/2023 16:05, yangchen.openbmc@gmail.com wrote:
> From: Yang Chen <yangchen.openbmc@gmail.com>
> 
> Document the new compatibles used on the Facebook Minerva Chassis
> Management Controller (CMC).

How is this related to
https://lore.kernel.org/all/20230907064514.1764010-3-peteryin.openbmc@gmail.com/
? Looks like duplicate :/

Best regards,
Krzysztof

