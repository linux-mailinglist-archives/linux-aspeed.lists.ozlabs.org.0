Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC060C232
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 05:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxHKW5z8bz3bcY
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 14:21:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ol0sHz7n;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ol0sHz7n;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxHKM27KHz2xZ7
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 14:21:26 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 20so10383875pgc.5
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 20:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Saad1VjrLJJL1LCehZ/TBtzn4EaztroRijG8WoCeQ9A=;
        b=ol0sHz7nMuqHFSby3FCnHCnQjENY3wKm6wi4zM2ZZVkElhNDD/iGsUbLH1rJSA2Ou+
         8rvndA+vl5JI3nGCKH0cDOHoBgAKdO18ck6vYkT3Tnrs4A0qGz5qkFPhD+2PhHexpstS
         Pe710Ua0r7ojFspKVtnI10c4xEdZ2T7iTm9exeYLZZhcVFYh/6m75RCuxhjGY+n9OE2q
         FvUyEZt/8aFQz857++JfGd8KN5wFlA0wXjeuYcsy6e072aMksUJe9UF0eowo7kmy6KZE
         a/FZ0wriyC+Kn3EPUCIMsC/+eydAR1uBK3riWh9HJuR4LMJTsUPWpk68WNZmlQY6Kyrd
         vtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Saad1VjrLJJL1LCehZ/TBtzn4EaztroRijG8WoCeQ9A=;
        b=ihYzIM+MG3KQ/7bLnJHvUczo9vu7kemBW+UZd8ZIm1ncYwmEFDZGK52PaGKfT4agEX
         niKSklNkJWGc8WJ2IS8uaYHto0eb7llDGqnQ9999/7y+UGVfwItenyCpBQAPEZ5E7uDF
         VFuPQIjFU+0bTsqJ5fh+R6XRSoO/VfD/mmISnwNmSr9uu/jLffwqwJIuJjfNKy7gHN6S
         myddhOfcU+oO6smhMOI77XOSOC20v9JOczrMH6ibexTiUakIuzfybP9MkPh0iJtlnfSf
         cG34cPuOgDkAnu4m0sQQLy9AdNVLQVQHyawtUH3Ulhez5xZF4MtyzResuMuqG3BlPCmX
         9PTQ==
X-Gm-Message-State: ACrzQf1JHjjihNbjxAR+NT6Xweb1X6+/I9Hj8XsPZHoGA3x7O2Qyu4Kg
	sJl1FADdYJcFMluDPKu07PQ=
X-Google-Smtp-Source: AMsMyM5pAZNaiWZrUBklX7+jX1N4m1Eel9ABmXtXCdL8xiJSqdUOToEX59zveNnEjfbbYyznb4BHVQ==
X-Received: by 2002:a05:6a00:849:b0:56b:a2d5:8019 with SMTP id q9-20020a056a00084900b0056ba2d58019mr12659788pfk.47.1666668083473;
        Mon, 24 Oct 2022 20:21:23 -0700 (PDT)
Received: from [10.10.4.41] (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709026bc800b00179c9219195sm410826plt.16.2022.10.24.20.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 20:21:22 -0700 (PDT)
Message-ID: <75b4faa2-d1af-17ee-6a2c-a39b59adca6c@gmail.com>
Date: Tue, 25 Oct 2022 11:19:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: bletchley: add aliases for mdio0
 and mdio3
To: Joel Stanley <joel@jms.id.au>
References: <20221025024145.1561047-1-potin.lai.pt@gmail.com>
 <CACPK8XdpeKVaxFki3GRyo30bWYNF6Q5wL706j5deaqi8P=ssdA@mail.gmail.com>
Content-Language: en-US
From: Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <CACPK8XdpeKVaxFki3GRyo30bWYNF6Q5wL706j5deaqi8P=ssdA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 10/25/22 11:05, Joel Stanley wrote:
> On Tue, 25 Oct 2022 at 02:43, Potin Lai <potin.lai.pt@gmail.com> wrote:
>> Add aliases for mdio0 and mdio3 so that we can use name to lookup the
>> address of Aspeed SOC.
>>
>> For example:
>> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio0
>> /ahb/mdio@1e650000
>> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio3
>> /ahb/mdio@1e650018
>>
>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
>> index c02c15f15465..2825d5f3f78b 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
>> @@ -15,6 +15,8 @@ / {
>>
>>         aliases {
>>                 serial4 = &uart5;
>> +               mdio0 = &mdio0;
>> +               mdio3 = &mdio3;
> Should this go into the dtsi instead?
Thanks for suggestion, I will move this to aspeed-g6.dtsi in next version.
>>         };
>>
>>         chosen {
>> --
>> 2.31.1
>>
