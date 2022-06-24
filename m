Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86091559342
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 08:22:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTn9W2t8Bz3btl
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 16:22:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.59.253; helo=7.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 602 seconds by postgrey-1.36 at boromir; Fri, 24 Jun 2022 16:22:48 AEST
Received: from 7.mo552.mail-out.ovh.net (7.mo552.mail-out.ovh.net [188.165.59.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTn9N0q3xz2yLX
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 16:22:45 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DCFD726D1E;
	Fri, 24 Jun 2022 06:06:17 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:06:17 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-97G002a741d817-3ab1-43d1-972f-d7ae1c10c91a,
                    5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3114efc7-5131-2de5-4ebc-6b6deeea1f23@kaod.org>
Date: Fri, 24 Jun 2022 08:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ARM: dts: aspeed: ast2600-evb: Update I2C devices
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
References: <20220623094717.3873328-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220623094717.3873328-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 77572050-9480-412a-a6cc-5d4782b5fe48
X-Ovh-Tracer-Id: 6077889174570503075
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhoheehvd
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 6/23/22 11:47, Joel Stanley wrote:
> The AST2600A3 EVB has the following I2C devices:
> 
>   - ADT7490 at 0x2e
>   - EEPROM at 0xa0
>   - LM75 at 0x9a
> 
> The bus these devices appear on can be configured by jumpers. The device
> tree is configured with the buses given by the default jumper settings.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   arch/arm/boot/dts/aspeed-ast2600-evb.dts | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index 5a6063bd4508..9da70b873ab6 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -207,11 +207,6 @@ &uart5 {
>   
>   &i2c0 {
>   	status = "okay";
> -
> -	temp@2e {
> -		compatible = "adi,adt7490";
> -		reg = <0x2e>;
> -	};
>   };
>   
>   &i2c1 {
> @@ -240,10 +235,26 @@ &i2c6 {
>   
>   &i2c7 {
>   	status = "okay";
> +
> +	temp@2e {
> +		compatible = "adi,adt7490";
> +		reg = <0x2e>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c08";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
>   };
>   
>   &i2c8 {
>   	status = "okay";
> +
> +	lm75@4d {
> +		compatible = "national,lm75";
> +		reg = <0x4d>;
> +	};
>   };
>   
>   &i2c9 {

