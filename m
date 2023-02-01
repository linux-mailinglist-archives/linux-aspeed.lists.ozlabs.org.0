Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DF068637F
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Feb 2023 11:14:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6Hp43QQmz3cgq
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Feb 2023 21:14:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C9Djn4E/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C9Djn4E/;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6Hnw1Lzjz3bfT
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Feb 2023 21:14:11 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so958623wmb.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Feb 2023 02:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAhoNlTJho5ZnwZSN6lbqDoq8aHHdJxgOkFCOiCRGuk=;
        b=C9Djn4E/y+WbPQRSb7rGXC3bXUj0z5dMPW8UG+wZaFqKgTXv5ulrzV4PWTXkCNbSMG
         EsIuWK9c5t1oFnvPpxr1SJD4mrDc5mEI8+QNhkYILbyhKuivB9EtXKSc6+V55gvj3WBP
         mUy3/XGyYUbQbphVQ7NwfKETJKbkTmRJTAqoPke3kAqgnY9/vaJUKy6I7SRu6KfRzs5u
         uT7FCmDjhdxDTfD5JrQQO8pB4BYnpaTg8HhhPPF5a0sNZpGvp8GZvrPJTAix/f6cRLH9
         44Ej7oe+DnZb3DxMYYQNIhxy3fHGV9Le74DvnpL0TyTiit90UOCYTpE38QTk5S1QwpbZ
         CQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAhoNlTJho5ZnwZSN6lbqDoq8aHHdJxgOkFCOiCRGuk=;
        b=NUAx14yyA4BSEiUo5HagzxNMg6nJgm6pag4GY6HPtn24Hcvn2BPil6c//4Ot8yL+Qc
         obsawvp9lR4G3u3DFsX8XfHrnMGnsARNLBHPW53IXgIx7KIDGVdh9Jb/3fKJWIym9NOZ
         pvm8ZcQz6RhdsIDBd09cU6cVCvXTOLGD6c+/TZB+bAhfHE4aFOF+OGWg8b7sPAVX0ahe
         tl+kpdCOqu5/eHDF8sgIWoiK2eAteHOfPTx5BawrrlAX86GdVCSmjw88JZ6Y3AiDqwVa
         aHVBWdpCuur+Bc/JXWGt0IlPvcr0M/1D9zk7uQcwMDKYDsj/WZ8/frJ6s4UzUeBa8mD8
         nlmA==
X-Gm-Message-State: AO0yUKX9MkZwELftj5wgXb4PQgyYx1Id6LZPh4vs9Ze2/zRryq7mCZpi
	cnFYyxOTR0U3Gif2Q48TeITzkA==
X-Google-Smtp-Source: AK7set/QB2ylCwztdMqI85o97PSgSoy4ia3dLIUk/CTPbDVz11aXGXi1yf3ARYrlnV6AKTfWyzezXQ==
X-Received: by 2002:a05:600c:3783:b0:3de:e8c5:d826 with SMTP id o3-20020a05600c378300b003dee8c5d826mr892459wmr.28.1675246446580;
        Wed, 01 Feb 2023 02:14:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b003a84375d0d1sm1309737wmo.44.2023.02.01.02.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 02:14:06 -0800 (PST)
Message-ID: <307017b7-2ecf-2ce5-4031-27bb6f09feb1@linaro.org>
Date: Wed, 1 Feb 2023 11:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: Add device tree for Ufispace
 NCPLite BMC
Content-Language: en-US
To: Jordan Chang <jordan.chang@ufispace.com>
References: <20230119102102.73414-1-jordan.chang@ufispace.com>
 <20230119102102.73414-4-jordan.chang@ufispace.com>
 <3e242c03-f8fd-2136-0263-2306acb9f610@linaro.org>
 <CAJ3czeT1O3iw2S_SK3z0C6dMiJ+-fUrWXPox4LJpJkMy_rVsJA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJ3czeT1O3iw2S_SK3z0C6dMiJ+-fUrWXPox4LJpJkMy_rVsJA@mail.gmail.com>
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 01/02/2023 11:06, Jordan Chang wrote:
>>> +     gpio-keys {
>>> +             compatible = "gpio-keys";
>>> +
>>> +             fan-status-int-l {
>>
>> Does not look like you tested the DTS against bindings. Please run `make
>> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
>> for instructions).
>>
>> These will bring warnings. Missing generic name,
>>
> I have run the `make dtbs_check` command, and did not notice the warning
> message 'Missing generic name'. It shows lots of compatible failed messages.
> - /ahb/ftgmac@1e670000: failed to match any schema with compatible:

You can run it with DT_SCHEMA_FILES=gpio-keys

> 
>>> +                     label = "fan-status-int-l";
>>> +                     gpios = <&gpio0 ASPEED_GPIO(M, 2) GPIO_ACTIVE_LOW>;
>>> +                     linux,code = <ASPEED_GPIO(M, 2)>;
>>> +             };
>>> +

(...)

>>> +
>>> +&i2c4 {
>>> +     status = "okay";
>>> +
>>> +     psu@58 {
>>> +             compatible = "pmbus";
>>
>> Where is this compatible documented?
> Can not find the corresponding document.
>>
>> Did you run checkpatch? Did it pass without warnings?
> Yes, I did run the ./scripts/checkpatch.pl and there were two warnings left.
> - WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> - WARNING: line length of 104 exceeds 100 columns
> I just ignore those warnings that Joel has informed me in the previous
> mail loop.
> 

Hm, is it then correct compatible?


Best regards,
Krzysztof

