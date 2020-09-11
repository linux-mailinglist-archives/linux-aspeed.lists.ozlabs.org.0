Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522326867F
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 09:50:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqdn74mKyzDqWg
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 17:50:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com;
 envelope-from=grygorii.strashko@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=yvbVhQNO; 
 dkim-atps=neutral
X-Greylist: delayed 5251 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Sep 2020 21:21:48 AEST
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bntcr6VpRzDqsb
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 21:21:47 +1000 (AEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08B9rq9H118702;
 Fri, 11 Sep 2020 04:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599818032;
 bh=dxP/WY/4dZH72YPcSv12tcPV/XFUasdrBjjt461p+Vw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yvbVhQNO427I3UMxxoaBckIDnOBYAZtnuKrvKA7Ps8tHAgg9811RsZRoZzEjIuxOa
 Yyxaml8IUgo1SjEXiZlaAi+FmWvQ1rslc9UkPlebDIdcaPyIfRXFTL+Uq+RnmCWgRU
 Ombas83IuTru1XXR6Zyhs879UIo5EJaKahah5VME=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08B9rqGn086091
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Sep 2020 04:53:52 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Sep 2020 04:53:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Sep 2020 04:53:52 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08B9riYZ038437;
 Fri, 11 Sep 2020 04:53:44 -0500
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>, Joel Stanley <joel@jms.id.au>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
Date: Fri, 11 Sep 2020 12:53:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 14 Sep 2020 17:49:20 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 11/09/2020 09:52, Krzysztof Kozlowski wrote:
> On Fri, 11 Sep 2020 at 08:24, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
>>> schema.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>>> +patternProperties:
>>> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>>> +    type: object
>>> +    properties:
>>> +      gpio-hog: true
>>> +      gpios: true
>>> +      input: true
>>> +      output-high: true
>>> +      output-low: true
>>> +      line-name: true
>>> +
>>> +    required:
>>> +      - gpio-hog
>>> +      - gpios
>>> +
>>
>>> +            usb3-sata-sel-hog {
>>> +                gpio-hog;
>>> +                gpios = <4 GPIO_ACTIVE_HIGH>;
>>> +                output-low;
>>> +                line-name = "usb3_sata_sel";
>>
>> I would prefer we didn't require the addition of hte -hog prefix. It's
>> mostly just a matter of taste, but I can think of a few more concrete
>> reasons:
>>
>> We don't require -high or -low prefixes, so the node name doesn't need
>> to describe the properties that will be found below.
> 
> Thanks for the comments.
> 
> It is not about properties (high or low) but the role of a device
> node. The node names should represent a generic class of device (ePAPR
> and device tree spec) and "hog" is such class.
> 
> The Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml already
> uses such naming so the best would be to unify.

In my opinion, It's not right to define this on per gpio-controller and introduce such
per gpio-controller restrictions.

More over, there is already generic schema for gpio hogs: gpio-hog.yaml
Originally, gpio bindings were defined without restricting gpio hog node names and,
generic schema follows this.

I think, the generic "gpio-hogs" sub-node may be introduced to place gpio hogs child nodes,
if gpio hogs node names restriction need to be introduces (*which i'm not sure is reasonable*).

gpio@20 {
	gpio-hogs {
		yyy-hog {
                         gpio-hog;
                         gpios
		}
	}

But this require as gpio code as generic gpio schema update (with backward compatibility in mind).


> 
>>
>> Changing around node names for existing boards carries with it the
>> chance of userspace breakage (as sysfs paths change). I would prefer
>> we avoid that if possible.
> 
> The impact on userspace is indeed important, but are you sure that
> hogs are visible to user-space via sysfs and configurable? I guess you
> think of deprecated CONFIG_GPIO_SYSFS?
> 
> Rob,
> Any hints from you about hog-naming?
> 
> Best regards,
> Krzysztof
> 

-- 
Best regards,
grygorii
