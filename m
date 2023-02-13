Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D6D694054
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 10:05:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFdjJ5JzTz3c79
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 20:05:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c6jCqyzI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c6jCqyzI;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFdj90XPXz3c3w
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 20:05:31 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id r2so11329425wrv.7
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 01:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9Nci8wBFuhi99Gc1NwVUN8p67Yll1xfOyVZyIiXTmM=;
        b=c6jCqyzIeeTqnOpkUl+DuqL8AIBElkbteR89Jakel9KRbmrx/Wg3h2tqF/Romqh+Wm
         2a2CLe26B9v7Ap1i4yQMjhcojGvapdrxysZDgJebigu9vKgm9kaDiNJu0lVS5ucNuuaV
         Rw6BQAMw+l6/TyIiD+Hi/TMSOTaJrvI4UZRqOdBWGf6/JKe3vV2LdZ8rJkJLTZbGGk42
         zT4aFyuQscahRdEO/Vf1saI7IasrdzVPZfP4CyW7/MhinfUWRoO84AIsShBt4DSyqNti
         yVs4LsiPmHywxkWTL6n6i9rzRxf01rGMNxDd1TxQiffM1M0B6CuIyDVQTOdd0HnoaXt1
         rF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9Nci8wBFuhi99Gc1NwVUN8p67Yll1xfOyVZyIiXTmM=;
        b=nc/bCQpA9qnXD+3jSqTAxBhKXX6BeJ8Hhet+VSxQ2yoMz4Kkf1wY/sQiwCqIZ89ANl
         PxeNnXKjKRqIkEeQ/+dvDsfpam14TDneLUfaMlycrWOiRIBhSlGoCkqQnzJcuNBbEyAn
         aKEvdXTbKVpRJf394StOjWJ/BldoRiEqoPo++EkSNSxkmMGLME2RNm1MSZNcKXZSUezk
         U37JqcHprMdz9/tYABERDg+KsyuwT0idIe1/F/4fzn549e3B+3mCONjnM+s4F1ryG+BR
         MCnIfomfRcIwvoudJE0/OrsfzfjB1BW7F0vjMvW01/bU1IgUBuAO1jOUGW0qbMkYQkL7
         38Fw==
X-Gm-Message-State: AO0yUKWZan3pts6LAy3mQ9uS2LcNuCrJLgtRvj9MqST8tdkElag64YsX
	ElrpwlxLD3m9Zw2XOpFVn+XBuQ==
X-Google-Smtp-Source: AK7set9J9oNwgtLShE6pSOoR54tX2fUdxaQjkklbsWgwbrEAwlSQDJi3IUpdUgLO35vSWsdrTZpfRg==
X-Received: by 2002:a5d:4c8d:0:b0:2c5:4cd0:4b86 with SMTP id z13-20020a5d4c8d000000b002c54cd04b86mr6778261wrs.68.1676279128064;
        Mon, 13 Feb 2023 01:05:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k16-20020adfe8d0000000b002c54536c662sm8637366wrn.34.2023.02.13.01.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:05:27 -0800 (PST)
Message-ID: <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
Date: Mon, 13 Feb 2023 10:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org
References: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
 <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/02/2023 09:55, Jeremy Kerr wrote:
>> 4. Where is the driver? Where is the DTS? Why do we want unused
>> binding in the kernel?
> 
> The driver is coming next, but I wanted to sort out the structure of the
> binding before committing to how the driver consumes the DT data - hence
> the RFC.

You should clearly communicate that driver is coming... Anyway binding
comes with the driver, otherwise how can we check that you actually
implemented it? Please send patches, not RFC. RFC means you are
uncertain this is even correct and you ask for generic discussion. So
generic discussion comment - implement how other recent i3c bindings are
implemented. This is basic device, there is nothing special here.

Since you did not respond to rest of comments, I assume you are going to
implement them fully - including dropping the questioned properties.

Best regards,
Krzysztof

