Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF80694130
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 10:31:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFfHJ25w5z3c7B
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 20:31:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bFObU7jM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bFObU7jM;
	dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFfHC3F90z30QD
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 20:31:33 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id o36so8247274wms.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 01:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/JPD/HGFlcGY8pIBqzAr6hXkdmNjgye2Jc6JXxETJo=;
        b=bFObU7jMb43E4r2kfQbGn//VMigCYiTVobtSUGjoUzlrxyjRvcTBsDbi3EmACqqLL/
         /2pTJEm35swfMuXODC0abe7SHHOpbktZu1PBVMqXkXr4j3RwvHibyy7roVtu9nCIG2WU
         bo7eTnvAo3cNl8wwriafJtx5pbko5p4PXV3imfXfFKo+mbg8BLBc30URsyxxi9lz+FEF
         4uDCVNhpljbycR/HqVAefHEYq1cE8zWBQ1rMBC/QS3cBbY7hCxVx2dt13IYRW3EbfqYY
         dcHuqU7ziwD4e4pKeaHkGM5c7G7aRmObe/hqDKy1PHOBkayVLgzgRV9cv4nnFtDiV/iM
         tNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/JPD/HGFlcGY8pIBqzAr6hXkdmNjgye2Jc6JXxETJo=;
        b=3g/yphaVF+ua4TZCFoFnbaf9f4d3D7uiGISfwHNVVhnj4gfGtctY/hV9xsDQpbJIFC
         OLgSEXGwMDic1V9nXR8EyNIjjMrqws1OimPmtV5QOok4dHsiBm2T7oj+j0IeAeANJmDI
         iDz/VUG4biBeol2PtjHWmdj4Q6EoIldq5uM7wku8HV7r7uEaRZsjdt4Jn2e6xlcgvwX6
         0sozWrl0c2/faCwtqLKFx8YcVvO2zg9mFSQaHbvFgR2WC0t2VNhM2cOsywW1bTSsBgo9
         I7K1cuUHM07uKdOhL/aaKDOQcZUd3aEC7lxb8h2Ed1Cw1fe0r08lttsB7PrWY3DP9vZM
         MAuQ==
X-Gm-Message-State: AO0yUKW7IIt6WRwuvUsqMJywk27QbY9QiICmSW+OctFGJdi4f9/gIuAI
	+mFBPRnFsucu7IJynKBdOQZBYA==
X-Google-Smtp-Source: AK7set/3O02tVN540fg79wkPY7NmAj6IESdePQro8rPLH2jh2lj8EcwtxFSfvBKV4Q2GWJGTPLok4A==
X-Received: by 2002:a05:600c:319a:b0:3e0:6c4:6a38 with SMTP id s26-20020a05600c319a00b003e006c46a38mr17604539wmp.33.1676280685520;
        Mon, 13 Feb 2023 01:31:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s10-20020adff80a000000b002c54c7b9c78sm7205100wrp.76.2023.02.13.01.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:31:25 -0800 (PST)
Message-ID: <1ab0b28d-8935-4e4c-ba8a-635de1f5bb8d@linaro.org>
Date: Mon, 13 Feb 2023 10:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org
References: <cover.1676267865.git.jk@codeconstruct.com.au>
 <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
 <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
 <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
 <2a3f5c20-3bfb-c1b8-f9df-d1908022509d@linaro.org>
 <34b2ebb4781c6157496012efce392743e1821c8a.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <34b2ebb4781c6157496012efce392743e1821c8a.camel@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/02/2023 10:23, Jeremy Kerr wrote:
> Hi Krzysztof,
> 
>> There was clk already, wasn't it? What do you want to change?
>> I asked why do you call it in the same patchset aspeed and as2600?
> 
> There was "clk" and "dts",

In patch 1 and 2? Please point me.

> where the latter should have probably been either
> also "clk" or "dt-bindings".

Aren't you referring to some other comment now?

> 
> I'll unify the "aspeed" to "ast2600".
> 
> Cheers,
> 
> 
> Jeremy

Best regards,
Krzysztof

