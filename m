Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B22E61EE8B
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Nov 2022 10:16:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5QbN2BFbz3c8V
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Nov 2022 20:16:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rLgN8Ab0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rLgN8Ab0;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5QbG6dG8z3c8V
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Nov 2022 20:16:42 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id l12so4750203lfp.6
        for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Nov 2022 01:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ee9rRE2EZYR3AFslDfAa5vqk35kYdBztnuAgp9P1svM=;
        b=rLgN8Ab0FHYbqyHfhx61S13OglQV0IxcL7oh3Q2DBIZpIffz/Sd22ckP2kXKhUWdoD
         XvrViZQmsTqi88VTF76St/XTn4YOdfkVFy5KKxKwnLTMQOjcTmoq8VR0FA+Xs2zANdP3
         uLffjmEj/GWzqAs9SLlrGU/opeVKi69yxnPhm545g7nJbioLzKGdmfMC0bdtU3cNLSCk
         a4T+Bk+uJUJKNk037idWb8jzsGZRaIlvfDF09tEqF/KG7mUN3b7m0jw4jEI6SaghYjBb
         ZvmvKp53XDqFo6SK4VuyIQsHh3B0qvWgJvurbkZ5lrnMxKVpRrLvHPb6hY/Vn7F1SBVe
         kbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ee9rRE2EZYR3AFslDfAa5vqk35kYdBztnuAgp9P1svM=;
        b=zO/sABQt9EZtb1Ur5mVBqbTtQx6wUKW3PDnGSMmrPh2XpsrXEl+5/y9hUGlF4ht+Nf
         RK9iC495bFepyrbEDW9nMtXSra0eMwhGEwUw1Y5dFaJ5AWY+4Y414L67Vu0B5zLB2k9O
         e4GTgDeCuyW1H/kwOUPvBUbIdmJNDvgmoRtjFIic+GoMV7wQVwsxyQf/9kt3zjTGYMT7
         5zb+NEvtbPxH6EAr5+rg7FIy0z8CILgBxYSixaRiY91INsd9vFeHxNWK6Mp6MZIImmR1
         tQA5RRnE2IWKhQ9H0SB2HoepPnyS/ONJVgRkZYxue05ADIylxeuX6NKHAegGctciHDdz
         RF/g==
X-Gm-Message-State: ACrzQf3Z1n8X0nVZOR31DXDIqzpsdf8duJ0PSiaP6XuSw4y2w9FWSCPj
	3RlJXZKmux82OfKGmA5KRgfgqw==
X-Google-Smtp-Source: AMsMyM640xZfzovEVbRzAzA3JwN3fsqXmGXCqtuz5rmj/QtkLofAuR/i6wzcJkcTdHZb+Jm513To6A==
X-Received: by 2002:a05:6512:b21:b0:4ae:391c:e655 with SMTP id w33-20020a0565120b2100b004ae391ce655mr16423127lfu.45.1667812592555;
        Mon, 07 Nov 2022 01:16:32 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e8e74000000b0027755f52a94sm1129600ljk.80.2022.11.07.01.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 01:16:32 -0800 (PST)
Message-ID: <9ddc0bc9-c5cf-6c94-d15e-77a7a7e2b7f1@linaro.org>
Date: Mon, 7 Nov 2022 10:16:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [v2 2/2] dt-bindings: iio: adc: Remove the property
 "aspeed,trim-data-valid"
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jic23@kernel.org,
 lars@metafoo.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, linmq006@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20221107091506.28630-1-billy_tsai@aspeedtech.com>
 <20221107091506.28630-2-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107091506.28630-2-billy_tsai@aspeedtech.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/11/2022 10:15, Billy Tsai wrote:
> The valid of the trimming data will use the otp default value as a
> criterion.
> 
> Fixes: 2bdb2f00a895 ("dt-bindings: iio: adc: Add ast2600-adc bindings")

If this is a fix, you need to describe the bug.

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof

