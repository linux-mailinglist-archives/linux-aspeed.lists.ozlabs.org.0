Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF40557398
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 09:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTBHD5KKnz3bts
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 17:10:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k4Adahid;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k4Adahid;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTBH61Qb0z3blf
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 17:10:39 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id ge10so7543874ejb.7
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tuAsDh6ucKESxsdiSZcdIthCGQnzlk9mmfrcHG2iA/A=;
        b=k4AdahiduJwbRRrlLYnDkTBxnXPULU8EsSsKDgjM192KdUz1q79NbQlx67tncTv9WR
         dJyAIlhWCepdwRz4igjrMh35uNeXgRCAWwiyWmth/8hLfwb3ZTBSsqfgy5r04qDRK9CH
         Gh6g0JM+Fyv59eDifA6RFPsoMfkoI+f/4Sx7HgiPQDZVafOtyu0uzVXTw5XDaVrgY8A/
         H0YdGhDxorkrMyTmpVTOquKodh24xUvWNKggOKObQK1UyZd/Idl/6S51Oz8TIni/SYdm
         iimCazHC2XGt0gxuQ7IHrDKEayFCNL7oqSaQe5TllniqP/31FG6V0/8ijYtS06KH3JzT
         gj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tuAsDh6ucKESxsdiSZcdIthCGQnzlk9mmfrcHG2iA/A=;
        b=xF3lH6EPtcwd2LjnzaR9yQzm4N7GV1lP9E35r+PtC0osTwVjABF6PyLyQ9YYbdxID5
         XVqtvbU/4lZAn/d71KYT4wf9+MrN88KR61hFd/y57P8vcKabez925brfRzyM6A3qRtRD
         TH3GTKa+dX9mvCjDVWohdxwlHv2gY4SEyWko6MmUS53TopGe2xa/waKTqgTHBpjdsNqx
         dBQmoTqDjK3gjgNydvSDsxiR08Qeb1Xjko/mNSk4UMArwopPd/lePIbxCPrGviMZtUWa
         c1RAx0F70nGjaCXcCGI8CXxqdtuoE+YFBYBigmZ6FNY/VogvabZ1V5jc46xS7Cp6w12s
         bEfg==
X-Gm-Message-State: AJIora+WWuqm2IbJmqPnL2qfTcinm/5F26Mjyx5N+gQNh/vnWLoHzGVo
	V5TN2gUc3uktzjiuvtgndwTanA==
X-Google-Smtp-Source: AGRyM1u7ecil3twaUG0Avny7RVyJxwjRhiEYGdWWNHrbEmPYuywGZuvfO1PXd4QE2NXFsLZ9uc0qrQ==
X-Received: by 2002:a17:907:c26:b0:711:ca03:ab3c with SMTP id ga38-20020a1709070c2600b00711ca03ab3cmr6967550ejc.654.1655968235516;
        Thu, 23 Jun 2022 00:10:35 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b006fec8e8eff6sm2286606eja.176.2022.06.23.00.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 00:10:35 -0700 (PDT)
Message-ID: <bd070c5d-4765-092d-8f10-fefd0361f65e@linaro.org>
Date: Thu, 23 Jun 2022 09:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: arm: aspeed: document board compatibles
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-2-krzysztof.kozlowski@linaro.org>
 <0207c2fe-7c01-7852-3cd1-74297cd4857d@linaro.org>
 <CACPK8Xc=dmaJtLXGsQa8bBdWDnSbwyW3f_yaQr4HqT0WvyScRg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACPK8Xc=dmaJtLXGsQa8bBdWDnSbwyW3f_yaQr4HqT0WvyScRg@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Wang <David_Wang6097@jabil.com>, Steven Lee <steven_lee@aspeedtech.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ken Chen <chen.kenyy@inventec.com>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 23/06/2022 07:36, Joel Stanley wrote:
> On Mon, 20 Jun 2022 at 11:06, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 29/05/2022 12:49, Krzysztof Kozlowski wrote:
>>> Document all compatibles used in existing upstreamed Aspeed AST2400,
>>> AST2500 and AST2600 based boards.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  .../bindings/arm/aspeed/aspeed.yaml           | 83 +++++++++++++++++++
>>>  MAINTAINERS                                   |  1 +
>>>  2 files changed, 84 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>>
>> Joel, Andrew,
>>
>> Any comments on the series? Rob applied only patch 1, so the rest is
>> supposed through Aspeed tree. Shall I pick them up and send to arm-soc?
> 
> I will take a look at them when it's time to send patches for the next
> kernel release.

But that's not how the next development works. Patches, if proper/good,
should be applied in some reasonable amount of time and then sit in
maintainers tree. This way the patches will be in linux-next, assuming
that maintainer correctly added it to linux-next. All other people can
then easily base their work on linux-next or maintainer's tree and
continue their development.

Waiting with the patches till time to intreract with arm-soc (usually
some late in the cycle, like rc5-rc6), not providing review, does not
allow other people to see accepted contributions and base the work on them.

Really, there is no single reason to hold on patches till there is time
to send them to arm-soc. It's the first time I hear something like this
about SoC or any other tree.

> 
> They should go through the aspeed tree like the rest of the aspeed
> device tree patches.

Of course, but somehow they were not going...

Best regards,
Krzysztof
