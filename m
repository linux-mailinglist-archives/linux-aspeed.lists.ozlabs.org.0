Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD925AF1C5
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 19:06:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMWxP1Srkz3bXn
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 03:06:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UpW2c3Q5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UpW2c3Q5;
	dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMWxG2zxMz2yRH
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Sep 2022 03:05:52 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id g21so8645875qka.5
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Sep 2022 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8sd1XUbOAaqPt2UCp3leBFo+ZTg1rtmlDOW2QOnPSY4=;
        b=UpW2c3Q5SPY5cpVDcDaldZhV6TrTm9uikL8Sd8wiKKD4SaxIUKoPBHv2xlT/0T+O7L
         wCu7F64Ybkzrdh56zxEGQXeG/IpapGwwmx77FSCnENV9Lu9pLSapSlNaENmkBhniPZKy
         w6Xwd68F9ZzNULGVSCZJyeyNRsKXvudlclI4hJgOSnjlExEJTYgxpdIh3HftxjAmzRB8
         W4L/L2C++Ddmcov4GGvSGX1RATzP2qgW6Bi7UoCtEDbqJh1KLK/z9sOQ8XiwbNcp7tfP
         BP+CR9ko7ggnxxhmKNfrdlBr8CTO506lDq917+e8kVpuy/xtkM/vHIAloK4gcW+xfZ1a
         O8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8sd1XUbOAaqPt2UCp3leBFo+ZTg1rtmlDOW2QOnPSY4=;
        b=SqnkTFmuZlCli3XJulGjqXs6J5tru/N1ujUWDK4VuJ+W81aJwAD7OQ8r24TlYTCebQ
         pcPBe2HHr5MwcA58omvY+Br+yUiWTGSpFrYd15uiJbloFmG4LdRHU/927qZkyMgP+sst
         9JJaFKEy/Ek7Lh74c6ztGaC6+p7oRsQyBNNQCML5iTBZx7MNMebfhRhc5bnUSFLYbYWl
         mpP3YbXK3hPM2Wmhtl/HpfnwHttVMQmWkFtNb6EOAUbWTpAj35qbujgMU8GDVWYc1aCt
         EzlC9mmW3S1C2kuEGrdbw+ExRUOccWIOMjnsF1KlhP/OjiJE9OZRuxWawNIrwpUR9TCj
         V1mA==
X-Gm-Message-State: ACgBeo0M3OGXj3QL5lNItoRChqGPkeARphWCiVVT9Axzd7aTsgwEp/Qo
	jd3aoSmy44YfkhKdvxZryAc=
X-Google-Smtp-Source: AA6agR5Fh76feQksNNuMqw8LuVW2nPF1DLvwm04cZ58xFgMHtAIHU/k+SKMVvtgd5SOemtCLL7r4Kg==
X-Received: by 2002:a05:620a:4089:b0:6bb:97e6:d5b1 with SMTP id f9-20020a05620a408900b006bb97e6d5b1mr37512666qko.117.1662483948729;
        Tue, 06 Sep 2022 10:05:48 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id fp5-20020a05622a508500b0031e9ab4e4cesm9876026qtb.26.2022.09.06.10.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 10:05:48 -0700 (PDT)
Message-ID: <45cdae58-632a-7cbb-c9d5-74c126ba6a3e@gmail.com>
Date: Tue, 6 Sep 2022 10:05:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH net-next 2/2] ARM: dts: aspeed: elbert: Enable mac3
 controller
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Tao Ren <rentao.bupt@gmail.com>
References: <20220905235634.20957-1-rentao.bupt@gmail.com>
 <20220905235634.20957-3-rentao.bupt@gmail.com> <YxaS2mS5vwW4HuqL@lunn.ch>
 <YxalTToannPyLQpI@taoren-fedora-PC23YAB4> <Yxc1N1auY5jk3yJI@lunn.ch>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <Yxc1N1auY5jk3yJI@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guangbin Huang <huangguangbin2@huawei.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Hao Chen <chenhao288@hisilicon.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Liang He <windhl@126.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 9/6/2022 4:55 AM, Andrew Lunn wrote:
> On Mon, Sep 05, 2022 at 06:41:33PM -0700, Tao Ren wrote:
>> Hi Andrew,
>>
>> On Tue, Sep 06, 2022 at 02:22:50AM +0200, Andrew Lunn wrote:
>>> On Mon, Sep 05, 2022 at 04:56:34PM -0700, rentao.bupt@gmail.com wrote:
>>>> From: Tao Ren <rentao.bupt@gmail.com>
>>>>
>>>> Enable mac3 controller in Elbert dts: Elbert MAC3 is connected to the
>>>> onboard switch directly (fixed link).
>>>
>>> What is the switch? Could you also add a DT node for it?
>>>
>>>>
>>>> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
>>>> ---
>>>>   arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts | 11 +++++++++++
>>>>   1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
>>>> index 27b43fe099f1..52cb617783ac 100644
>>>> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
>>>> @@ -183,3 +183,14 @@ imux31: i2c@7 {
>>>>   &i2c11 {
>>>>   	status = "okay";
>>>>   };
>>>> +
>>>> +&mac3 {
>>>> +	status = "okay";
>>>> +	phy-mode = "rgmii";
>>>
>>> 'rgmii' is suspicious, though not necessarily wrong. This value is
>>> normally passed to the PHY, so the PHY inserts the RGMII delay. You
>>> however don't have a PHY. So i assume the switch is inserting the
>>> delay? Again, being able to see the DT properties for the switch would
>>> be useful.
>>>
>>>     Andrew
>>
>> Thank you for the quick review!
>>
>> The BMC mac3 is connected to BCM53134P's IMP_RGMII port, and there is no
>> PHY between BMC MAC and BCM53134P. BCM53134P loads configurations from
>> its EEPROM when the chip is powered.
> 
> So i assume you have the switch RGMII port doing the delays. That is
> fine.
> 
>> Could you please point me an example showing how to describe the switch in
>> dts? Anyhow I will need to improve the patch description and comments in
>> v2.
> 
> It looks like drivers/net/dsa/b53 does not support this particular
> switch. You could consider extending the driver. See
> 
> Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
> 
> for documentation of the binding.

Correct the 53134 is not supported at the moment by the b53 driver, 
however it should not be too hard to support it, if you would be willing 
to add it, I would be glad to review patches.
-- 
Florian
