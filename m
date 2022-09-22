Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE485E5B9B
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 08:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY5Rp3zDPz3c2q
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 16:47:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YT4rwaGs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YT4rwaGs;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY5Rg73Lwz307C
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Sep 2022 16:46:54 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id j16so13103604lfg.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 23:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lD7eGEkv9NNmbwuFNSY5wNAY2Knw/AnArDcDD7Ihsks=;
        b=YT4rwaGsNKJG3KJBaTg7AUI0lTcs5pu9cde18uITqorpKfQXMhgzunwhvvBDo9PKhC
         Qf9hYFBQWxbBaPKIpB/KhzBCCG2TPOcVFr0FNlkpyyaGJDT42yhiemFHusfEtY0LVWVa
         FNZVQ03Ncc2PhW19hQ47E8a0WhjnsAWJNPT9MVwI72MYgAqdZr4WYAzzPXEsliKFJuHA
         DdErzWJQk0NN6oPn1IxJhox2r9ZcjANslzC2xURXaooUD8aco5iN1Ai8Q0g7wm60qdNT
         IPP2luoHMWMh+0t6J4ni3MdF8Y78D3tpN635v0AsB2oXsMjym34mt5Mc7oujN6RLsCTy
         VmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lD7eGEkv9NNmbwuFNSY5wNAY2Knw/AnArDcDD7Ihsks=;
        b=W7jZG8zPVFMDkZHyXpaMTuN/RKH8hhD5y8H4cF4zbHhetgOFc20lMsNOx1t1e31U8F
         rm+XMRuu8eOUSNsMAocsMQsV1m/zieLWmcMmSSLurVM83ibK3KUjZrw3K7+mKjTITZ3C
         4rKTIEGI/g/O4Je1rmAkXMbmjdLsbi/1MCW5gepGi9hVu1D84DfxsfM2+Rb+CLUrKLLo
         4D95UD9CBDC+wV365TL1FF54+ViT3RK/4VkDqDwHBqUJ/OMTGqsm/1wt5yTjZWFxXS5I
         WABctdlgMZaQmCPi0PPVmPkQzerifVLw6foULbJCjVUcZ9SqbG3mXx00M4MVZSzA4kJO
         pdSg==
X-Gm-Message-State: ACrzQf2z8KUtJkbORbnqFC6Mzo7fP9uk12lhHIWNgirSVlm9SrkgaDCq
	jb67RPULP0yuEyXgKiljGfhCXQ==
X-Google-Smtp-Source: AMsMyM6BxgcSAwVtLlEKusvSWmnmLV6poxPCMlvtdabspSYBYoJIoYD1EYIbi1fGCHJMsVaqCxy8eg==
X-Received: by 2002:a19:7406:0:b0:49d:d448:59c3 with SMTP id v6-20020a197406000000b0049dd44859c3mr630832lfe.300.1663829211573;
        Wed, 21 Sep 2022 23:46:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 8-20020a2eb948000000b00261e7244887sm733355ljs.60.2022.09.21.23.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:46:51 -0700 (PDT)
Message-ID: <87800017-a620-041e-15af-3386ca671eda@linaro.org>
Date: Thu, 22 Sep 2022 08:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Content-Language: en-US
To: Konstantin Aladyshev <aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-2-aladyshev22@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921210950.10568-2-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/09/2022 23:09, Konstantin Aladyshev wrote:
> Document AMD DaytonaX board compatible.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

