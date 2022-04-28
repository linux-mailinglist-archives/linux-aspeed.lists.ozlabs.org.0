Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3385168B2
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 00:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ks1N23f0xz2xvW
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 08:38:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lwaaQoJP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::636;
 helo=mail-ej1-x636.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lwaaQoJP; dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpmYY0FRdz2xnX
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Apr 2022 16:53:51 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id y3so7566575ejo.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Apr 2022 23:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2VtYpl+AopG0sr9SMMb9GWmnfMrojG66n7RjufImm50=;
 b=lwaaQoJPHunxuYnucsJqsKlb/ZFMAcQ+0k8j6mvSEbAo+tDnwkfLRmrWMus5ro/udm
 FOHnvHIg+Od8zeBv9pcz/+cSrUdxgqQjP7LUfO5NpvqYDQmijdUhOcA1fi34Aq+v38MX
 LhJVz0OpmKIEFVZr1zh0LqshKffrL5kTQmEbOHNw8+fdZsutWv+daA9N/88TA6yG2Me+
 IP84bUWImyT7N4KoEfs6JcgGo0jE3XVl0Y+aXu9Uo8Eujf8kUR0SMvaMN82ptr0AJudN
 A4IHMQF5otBDYl5yva1nkfVg+FjDmhen4fiFXu/kXW6txMcdM5evUL/uXw7KbIfuXHKO
 /PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2VtYpl+AopG0sr9SMMb9GWmnfMrojG66n7RjufImm50=;
 b=ZISunuLiSR6l1TO+5aQxjbgoS9qb1s2pgDGNfnsoCwJNRXnwe3FMmM/SRKJBfk/Ljg
 YoIvcBRUge6ZqYmoEwCLhkmkSnRdwhcZuKEdOBB1BUzBf/vxySNHzRXta02DtDTLtqCB
 5nNQ19g2eF/r0pKGkagb6eqBziOzNd83kIy8ds/r2kczK27BxEfCtjW3sAby0PSE0lVB
 yAkkBQjxiGY+BKyhIY8IEou0AE5Owai1uR9hAyzewCtx5pqKwbXVc78CMqsvBNCX50+l
 KuO0uc6rBbwXLs90MxVY0tcwmfMO+N8tY/YGf5EUTuE9BJnE2duJE8HTSblh84dIhEQO
 lK3A==
X-Gm-Message-State: AOAM531obFnnh1RFCiMbQF3Tb3ARUKSXqYx8g2POalQ5zf94kOmsWamy
 dQwZ2+0c3K08whhSU7FsRL3cWA==
X-Google-Smtp-Source: ABdhPJzso+XpXZx+m3nRJuf0ndPiYOfzhdXdRErjmKATg8VtTt/Cvcsd1y1NHq262yirrd9t4vNvdQ==
X-Received: by 2002:a17:907:6090:b0:6f0:2a64:2ef7 with SMTP id
 ht16-20020a170907609000b006f02a642ef7mr29814689ejc.476.1651128828187; 
 Wed, 27 Apr 2022 23:53:48 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o22-20020a170906289600b006e44a0c1105sm7920189ejd.46.2022.04.27.23.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 23:53:47 -0700 (PDT)
Message-ID: <7f435547-35f5-7885-3b1d-159199ca201a@linaro.org>
Date: Thu, 28 Apr 2022 08:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Drop referenced nodes in
 examples
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>
References: <20220422192139.2592632-1-robh@kernel.org>
 <CACPK8XcQNJNyzqdjMQuCP+z-L-A9mcMqs-HJJrh9MscasV+D=A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACPK8XcQNJNyzqdjMQuCP+z-L-A9mcMqs-HJJrh9MscasV+D=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 02 May 2022 08:36:50 +1000
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 27/04/2022 10:40, Joel Stanley wrote:
> On Fri, 22 Apr 2022 at 19:21, Rob Herring <robh@kernel.org> wrote:
>>
>> The additional nodes in the example referenced from the pinctrl node
>> 'aspeed,external-nodes' properties are either incorrect (aspeed,ast2500-lpc)
>> or not documented with a schema (aspeed,ast2500-gfx). There's no need to
>> show these nodes as part of the pinctrl example, so just remove them.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Nak.
> 
> This removes the information on how to use the bindings. Surely we
> prefer to over document rather than under document?

There is no need to document consumers of generic providers, like
syscon, clock or pinctrl. These are already well documented. The
examples of consumers here do not bring any additional value.

Best regards,
Krzysztof
