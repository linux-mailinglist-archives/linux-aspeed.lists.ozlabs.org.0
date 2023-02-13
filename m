Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EC469414E
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 10:35:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFfMm0rWyz30QD
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 20:35:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ClAtuvBe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ClAtuvBe;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFfMc02rMz2xjw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 20:35:23 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so8493187wmb.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 01:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gmgucw7ArcE1rVHBJg9HjFw2E1lAyLd9N9iv88RjGQE=;
        b=ClAtuvBeysiK4DiEo6LMV3dTn1HCCdUhBXbF5Ye+aVaPFpxD9yHzuKfl1cOzH1Dbu+
         DeUNqql54iNavpEAhMFhIQEUhW785AX9d3ge/8WbagLLx4/zs6eSWZFYOGjLPErFQCoJ
         AQNJIOlNEqi+KerCvb/Hz15ePbUcm4ZpUpwB/QIkheyJ0uYQBfoaYdObvaXQM5Zmsu7B
         H6ur1q3icdwV2C2qt9qtlQL5zAsXwFjnfWkRt/Gv99w7POcqPZMeLU7F59zHUivodIfs
         +uBaMZUyd0EmdS7DEC6YC2735WGR+iRt6AhhdqOWpHXTFfu0eab4f97qwOArJyMDJYHl
         ekvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmgucw7ArcE1rVHBJg9HjFw2E1lAyLd9N9iv88RjGQE=;
        b=AaZByfHnuSciZx9OHgVN0nXKzOeog1uWjjqiB6UHY6FBk6i0OyDrrV2Kbo+9fsk4IK
         +dy8phfwRJBsfLkL61sbjCMJw6i6ZAssX/6EfV+Sd/Ohnc64xI2r+rnHivQJvnHxDNBV
         mdD2jslpzhxJ+E5BmPoLb1zMZKc3H6zmBYGT8MHLmEd10eYIUOQHH1Pk3Sr8Nr50Cg5f
         G9kNt5oiM+IUhX+wanZm0mv9W1sd5+S4AqVPF2fHy4hmQul656EQyZt/0bdknAAgmyCT
         XCEVc6QYIosMdgicWWqw6hIxrmOAx0qeVd0BrkOmeQ4RVGd+RloxbwvjzM/HyqATix94
         QYlA==
X-Gm-Message-State: AO0yUKWkA+lDPsWqq6vFVJIXCY0bEURGnZjyHeXPFKEtaeQPi2L9pISm
	3bM1mzprQCn1aeHrxfMs6rNM4g==
X-Google-Smtp-Source: AK7set8t1hWdwz4+lb2JgagXmy8pG7Dx7iXEOWfMIit4rR4uri5IsmUt3xVOuYZuZ7mMxX4PXm7AsQ==
X-Received: by 2002:a05:600c:3b92:b0:3df:eedf:df1c with SMTP id n18-20020a05600c3b9200b003dfeedfdf1cmr22437691wms.38.1676280919784;
        Mon, 13 Feb 2023 01:35:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w19-20020a05600c475300b003e11f280b8bsm11265977wmo.44.2023.02.13.01.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:35:19 -0800 (PST)
Message-ID: <71aeb3da-13a1-1c79-9fe6-f5c23d398394@linaro.org>
Date: Mon, 13 Feb 2023 10:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org
References: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
 <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
 <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
 <80fa21969d9e0e7a123bd525199dbb40e79d47e3.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <80fa21969d9e0e7a123bd525199dbb40e79d47e3.camel@codeconstruct.com.au>
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

On 13/02/2023 10:21, Jeremy Kerr wrote:
> Hi Krzysztof,
> 
>> You should clearly communicate that driver is coming...
> 
> OK.
> 
>> Anyway binding comes with the driver, otherwise how can we check that
>> you actually implemented it?
> 
> I'll include this with the driver once we're past the RFC reviews.
> 
>> Please send patches, not RFC. RFC means you are uncertain this is even
>> correct and you ask for generic discussion.
> 
> Yes, that's essentially what I'm looking for with this change -
> particularly with the pullup config, which (as you say) could arguably
> be a pinctrl config instead.

Depends, there was just a short sentence. If this is external resistor
on the board, why this device needs such property (and none of other
devices need...)? If this is internal pull up of I3C (and there is no
other pin configuration possible, no other pins), it looks reasonable to
me to have it here. But I am all guessing it...


Best regards,
Krzysztof

