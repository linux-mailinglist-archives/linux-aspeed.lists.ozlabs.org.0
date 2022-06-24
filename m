Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C45593FB
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 09:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTpGY3S7wz3c93
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 17:12:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KWHKUG0N;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KWHKUG0N;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTpGT1xV2z3bd4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 17:12:14 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id c13so2127684eds.10
        for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 00:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=2gnwhLkz//Lr9PwS+PlyoY2fhYDAe2RIemWacp+cIxw=;
        b=KWHKUG0NXbook3uGdrrcwExPIs859eoqcM8phquK3Kl8hEXRSIi7nrSPBMWE0x3fKi
         SoGNjhtF7g5GAcjGbzI0MytmCMVGg+p3g0NMSyAwYhO+9VPwZzIKWNx0BvPVX14Wtqnh
         NQetHwhDwRF8cR4IVHxYjH5sJzF/vFbVMjYqQ+QTMYksii1OEO17kSqIqRvZDFB/u5vm
         ev9DVQr2N4I+hOjvDcuD4BbiFm1bTrMFuuLkZDYaMEN4b+kZGBhDiW7drkSpBEJ2Nv1S
         B2k0pZ/pMzSRxMjzke5boTaX3XHDN9juBPwlQDoVmG+TGeAPFqFHMPXgCqMAXzRfGJ9q
         jkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=2gnwhLkz//Lr9PwS+PlyoY2fhYDAe2RIemWacp+cIxw=;
        b=FSYkFa6XNPTM2g+ZJw40bnqAdaYuwp358NyvwWCXeiJl6nLmijcBmoW/iM98dtLAW2
         5oVaKEbzgxgn0fF6NLJ8uUoA16ZiAFdptaYx1jxw6hD0VM3af8ltpwoL/ET0bmA+pFpT
         8vL1+6yjexNcpV6aJJsCFuWTmvbH04gUUfKN/0r7t/cfGFIvnHsp79pP0pSZYO98kFKE
         x9fP/RWeT26LmTcn9tKOP+Ivl/s0XggYT1J2G3q6hBTUq4WfDlk1Q2AgIxzBndvglPAM
         1+p1gXVyqUDpfA13uFKkI33PKnXnXj8Ah2GKzNpcSCIUWk3ruSh44MwdNNtV1B34avS1
         ysXg==
X-Gm-Message-State: AJIora/E1KiLoMPKxDZ/fIwN4Na8N6CZsAPjNA7X83ugP8CWjnyMmuWd
	AV3eHNje3Nuow+hOZsr4b3lfRQ==
X-Google-Smtp-Source: AGRyM1slPp5YhKubruMtrStgiaOe29+R5gvoqEqIxtmRCwIsImiR2RA+0bdWl4Ky8ykAKUrV+iSovw==
X-Received: by 2002:a05:6402:2422:b0:435:6707:7f1f with SMTP id t34-20020a056402242200b0043567077f1fmr15931322eda.38.1656054726537;
        Fri, 24 Jun 2022 00:12:06 -0700 (PDT)
Received: from [192.168.0.233] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906044700b007030c97ae62sm598868eja.191.2022.06.24.00.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 00:12:05 -0700 (PDT)
Message-ID: <0378a9e1-a2f9-5c7d-2fdd-0a78ff237db9@linaro.org>
Date: Fri, 24 Jun 2022 09:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: (subset) [PATCH 7/7] ARM: dts: aspeed: centriq2400: use qcom
 compatible
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joel Stanley <joel@jms.id.au>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-7-krzysztof.kozlowski@linaro.org>
 <165589305701.29629.10216921074802952879.b4-ty@linaro.org>
 <CACPK8XfxXi8kQr+vxta8rD6SBgxLf_oBjAH0UkPBacQta552YQ@mail.gmail.com>
 <84cba0c8-fb31-3314-5e2c-7a0c13030b9a@linaro.org>
In-Reply-To: <84cba0c8-fb31-3314-5e2c-7a0c13030b9a@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Wang <David_Wang6097@jabil.com>, Steven Lee <steven_lee@aspeedtech.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ken Chen <chen.kenyy@inventec.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 23/06/2022 09:05, Krzysztof Kozlowski wrote:
> On 23/06/2022 07:34, Joel Stanley wrote:
>> On Wed, 22 Jun 2022 at 10:17, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> On Sun, 29 May 2022 12:49:28 +0200, Krzysztof Kozlowski wrote:
>>>> "qualcomm" is not a documented compatible and instead "qcom" should be
>>>> used.
>>>>
>>>>
>>>
>>> Applied, thanks!
>>
>> What tree did you apply this to? Did you get review from the maintainer?
> 
> Tree was mentioned below.
> 
>>
>> This board is unmaintained and unused. I would prefer it removed
>> rather than meaningless fixes be applied.
> 
> I can drop the patch. I'll send the patch to remove the board.

Does your answer also means that you are planning to take these? I am
going to prepare a pull request to arm-soc so need to know whether to
keep these or not. I don't have any particular need of handling these
patches by myself, but I want the issues to get fixed.

Best regards,
Krzysztof
