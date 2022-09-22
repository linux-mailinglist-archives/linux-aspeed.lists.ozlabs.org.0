Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9055E5BA2
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 08:49:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY5VM2kxTz3c2N
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 16:49:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kMRtMXiE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kMRtMXiE;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY5VH6vtfz307C
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Sep 2022 16:49:10 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id f9so13088836lfr.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 23:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kivIBO0juD/4ymQdgeIQKWbZZAbTDNdx8uwuKAi1JwQ=;
        b=kMRtMXiEbrRFe3n2fOiOzKCO/dOQKqmUGDb/4vkD61IY5CPk0zUwAbkildFaGnxYac
         6Bb2B2CDW1RNXQVeEF/O2wmxfX9laLgXa4CveanPLqRDfru0nDxSCJTynsO+W4B9hKG/
         aS/BkKGxB+qii8DACTyyvRVhli6DysxYWBguALi94yE/PqL3zrOjIvZhTH8ceDhK1H66
         59W84lUkWmg8aJA3x8jk/vR5wRmBRXjOIFTx/lx13t1ZM0wWrKCmGHNFv6IkwWKcNHi3
         uCmupZtN6jkygjegr9iJKrdgyPjGLZGEA7+Inm0gsyHxGwQ9y+uGoqwLo2rG3nmZTsMw
         QMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kivIBO0juD/4ymQdgeIQKWbZZAbTDNdx8uwuKAi1JwQ=;
        b=AvartzqGSIABGQiDayAiJi1CKlT7Fa/YI4lISuUMt9rREcF122/T6nXWWBwboe418p
         OKuEg3e8IftLKkUazIBrv022h2UKZbqfUNvjN50LMro22BXWLUQLDGOvk6Whw41+wr7O
         zoWYWhnjSamfuZrJLG/QU20fG0NyfGRWCw74VgYtnpjV0PcqpXrao7PBuD2Ob3Pit/1F
         j1JR0NxvFbHVUpbPjwippqe2dlLMvkT0eR7EqLNbT9VXVZ7VEMfFrXSgkKs1COKlwqx6
         /RncIxgqA35ihcGHDwq0Hwy1PxEkyZZgXcPp5MLZw4C5lnbGEo4V5CsRbwPfuDIFcEPm
         cxfA==
X-Gm-Message-State: ACrzQf0FYtSdRqKMoAkHwrp5Aci25YTCJOPUwaVK+BF3FcLnyM/zX9Zq
	G7Dpyi8TS306CvIakzP0b2jPbQ==
X-Google-Smtp-Source: AMsMyM7s6qfEd5T3ZhNN1ZdqiLbx+dvO8AHetJr7BtwPbvytPmPn9zEVC1j5F/16ObgOnVzQV5PJhg==
X-Received: by 2002:a05:6512:3a8e:b0:49a:e5ed:d6aa with SMTP id q14-20020a0565123a8e00b0049ae5edd6aamr699253lfu.271.1663829347013;
        Wed, 21 Sep 2022 23:49:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b27-20020ac247fb000000b00492f5ad0ae7sm795809lfp.43.2022.09.21.23.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:49:06 -0700 (PDT)
Message-ID: <1c33bf6d-b458-b2bb-3116-ed20b9cadc0e@linaro.org>
Date: Thu, 22 Sep 2022 08:49:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc
 compatible after rename
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed@lists.ozlabs.org
References: <20220811062953.5976-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811062953.5976-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/08/2022 08:29, Krzysztof Kozlowski wrote:
> The Nuvia DC-SCM BMC board compatible was renamed in commit
> 7f058112873e ("ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom"),
> so adjust the bindings as well.
> 
> Fixes: f77024c80147 ("dt-bindings: arm: aspeed: document board compatibles")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Fix typo in commit msg.
> 2. Add Acks.
> 
> Changes since v1:
> 1. Use proper qcom compatible.

Andrew, Joel,

Do you have any more comments on this patch? Do you plan to pick it up?
5 weeks passed..

Best regards,
Krzysztof

