Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848A538D68
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 May 2022 11:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC5xL2jPjz3bkn
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 May 2022 19:06:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=evfYu89q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=evfYu89q;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC5xC4l7yz308w
	for <linux-aspeed@lists.ozlabs.org>; Tue, 31 May 2022 19:06:21 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id v19so9282731edd.4
        for <linux-aspeed@lists.ozlabs.org>; Tue, 31 May 2022 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=B2NZyh+cIzrC0yFlwkj26EY9e6xfk3X9ZOP0bB7w4RU=;
        b=evfYu89qrruMy5yGwmxBJhM8KXCVIu/OZBaUQPkSOXRQHIJSgPxnAPck4/CEMxA2xS
         9A7fxfcNylHRm04f+y4UMLYh/5/ugmpXz/dtkGEleESJNaRVi5nItdPU3zCXw6R/FyTk
         pEAm6gxRh8AHpjMqWy7kfyHE+70PbcPRhs25Ua0PkuS/i6eLr4f2Yr8nPe5tFyqo7g8k
         RFDYapRfPijF2lpkcIgRSma8knwy6R00DZgglmSmZVwx0/EoggbEtqt+ZvIHxilNQgjW
         jMhwJHDaFGIg960qPHjNUv7zjTAy5mCruh52XrxatfsES+i/H1XvXEfg8VsinY91pwT/
         FOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B2NZyh+cIzrC0yFlwkj26EY9e6xfk3X9ZOP0bB7w4RU=;
        b=IYAQ3mzxwuDPOkJRerCvEIPBlSDnq+uQ0SrBazP2AKh7VEKiHgE8svohVCsB33vShL
         W/C49S4nUtJwBX/Y6wvIxxmoPW7VVsQK/0gbKKY+1Jfg1qgCnJSSC68noVSAWeoBWOLJ
         GJERHtgkQK6c+OmjnUjY+diUZkHGATsPYKF1aal/O+PtilehqefXSRuLIjp9GU9cv+Zw
         kc91e/lVsbIvYSmVE+OFZvmyKJ7IhaDhXoUUQSG6Y+4uPNKGxrja8Rrio/UQMRda3g2N
         sd43fbFsip+6W/6tu7H1Gq3K/WiuCNXKhH2Ls0QiA+BS8O6ZehhlVEdZ68oE3Q5kCFpX
         mCUQ==
X-Gm-Message-State: AOAM533rGFEzBdf49oMcYfCJ3fKWilHtn8tBobAVBGnxu/+2irR7si9V
	OhMqZFiOpxA2DqsgLqDbMbLikA==
X-Google-Smtp-Source: ABdhPJzfU8m5rdIdp7q9S5qXsHiz9hvCjAboBg4T85QPihizQhore6X/2gC1ZgEh7FJCE7skEc8wyA==
X-Received: by 2002:a05:6402:d0e:b0:413:3d99:f2d6 with SMTP id eb14-20020a0564020d0e00b004133d99f2d6mr63612187edb.189.1653987974122;
        Tue, 31 May 2022 02:06:14 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fi5-20020a1709073ac500b006fed93bf71fsm4808930ejc.18.2022.05.31.02.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 02:06:13 -0700 (PDT)
Message-ID: <ae36420f-847b-c53b-24ad-22e3181bff51@linaro.org>
Date: Tue, 31 May 2022 11:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] net/ncsi: use proper "mellanox" DT vendor prefix
Content-Language: en-US
To: Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20220529111017.181766-1-krzysztof.kozlowski@linaro.org>
 <48cb78ebd38dfe4ac05e337d5fb38623b7ee0e8f.camel@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <48cb78ebd38dfe4ac05e337d5fb38623b7ee0e8f.camel@redhat.com>
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

On 31/05/2022 10:21, Paolo Abeni wrote:
> Hello,
> 
> On Sun, 2022-05-29 at 13:10 +0200, Krzysztof Kozlowski wrote:
>> "mlx" Devicetree vendor prefix is not documented and instead "mellanox"
>> should be used.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  net/ncsi/ncsi-manage.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
>> index 78814417d753..80713febfac6 100644
>> --- a/net/ncsi/ncsi-manage.c
>> +++ b/net/ncsi/ncsi-manage.c
>> @@ -1803,7 +1803,8 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>>  	pdev = to_platform_device(dev->dev.parent);
>>  	if (pdev) {
>>  		np = pdev->dev.of_node;
>> -		if (np && of_get_property(np, "mlx,multi-host", NULL))
>> +		if (np && (of_get_property(np, "mellanox,multi-host", NULL) ||
>> +			   of_get_property(np, "mlx,multi-host", NULL)))
>>  			ndp->mlx_multi_host = true;
>>  	}
>>
> 
> I can't guess which tree are you targeting, devicetree? net-next? could
> you please specify?

Both independently. The patch here for net-next (although it is closed
now). The DTS patch can come later via ARM SoC maintainer tree.


Best regards,
Krzysztof
