Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFED4DAA0B
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 06:46:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJK5K0Kggz30Dk
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 16:46:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=QY7I2K5l;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jOnQA49l;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=QY7I2K5l; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=jOnQA49l; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJK5558gBz2xDM
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Mar 2022 16:46:01 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4DBFE5C0145;
 Wed, 16 Mar 2022 01:45:58 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Wed, 16 Mar 2022 01:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=aMf88yxhRA0NPV
 Qfay/avZZJy2v8phUznCwO72m0oXk=; b=QY7I2K5lB1HX+l6rXBrckDA4ucp9p2
 kCje5TRiWaqXcYHZbcgPbbmwYDmcMM8Ozl6DMBtr4oC47T03qvmRz+zeDxiI6CLx
 FMckiP0ckMKsI/r+Omhfp+M733OUMH0ZD2mQs71YIF5FwzCGSNjg4FQ/vgtdR9Gk
 mmkGxjHD5kuz0JPSkVX9PxCkNJOWkkrk+ABCvfwycP87ZAJEEFd8MEEsHXtWvoql
 ZJRxYI3YGu2L+aA8exPD1fqdiqQVo0ziDbVKd5avwdeP7r22nC2og70Tn/yZiGNn
 RnLDUQs5JnP1KGJ36k58FwI/pkZ6d8jxY1seWa+Oxfi+CMEQ63hmnTHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=aMf88yxhRA0NPVQfay/avZZJy2v8phUznCwO72m0o
 Xk=; b=jOnQA49lcdDRu4ixehqRjf6BfiUpTcZfK6hB1BIP9+zBcETM1S3VEW5YG
 h1f/dEr0WgndNAdpe9PZZ7ig2rohucvLPo6IpnWIHql9nY5PjC7re1crJDkbPsOk
 fw9cYrAkRfdrd9yo8tAfEw1JvdFCu7tsDjXsMsOdYp7NBPBgMRldb4N+pMvWRKoA
 A25Qz3emybIDhtKxBsUF/wL9umL/lJc2awUazpytxwrZ7Teu2Q5Dt5DEhYvp4MxT
 Z+upzgf7XfsVbUfHkn+iSiU0jJ36tMaOb/4cKvvlQSd4PnTXvH9C54zH14gQ1Ub4
 TeaJnXpSRcyXdqdOyFJe+aLgB5L/A==
X-ME-Sender: <xms:knkxYmdic9v8LEszlcDMSgFv0jF8dUzrvM-FjRX9sUXJnWtNjxTBrQ>
 <xme:knkxYgOMc2tAuxnpUDKQBTNdZlcckABsZ_BIUxjP2y33CHTykCl_Vi14JsLoTjlAt
 QUdrsrrBcSFTjyAGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefuddgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:knkxYninITRjeuFGivExuRIRRuZTO-1_cGwFrR2iWj-vZv1PYdhYbA>
 <xmx:knkxYj-KTSYzlKveV9G3Vn0NsRd_m1JV0SBuxZWp9aB5uNNJn8HBdg>
 <xmx:knkxYis7kEnMJHvj3H_98NnbAGYiztqq_O8vM-5UNHqzsWlzXb-vKA>
 <xmx:lnkxYv8cNLNswTjj4p4SEUhybRilelTXDHfhJqMnTHdau2X1zbV3TQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D5383F6007E; Wed, 16 Mar 2022 01:45:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4907-g25ce6f34a9-fm-20220311.001-g25ce6f34
Mime-Version: 1.0
Message-Id: <3056f002-4d9a-461e-8a29-12b6742e99fb@www.fastmail.com>
In-Reply-To: <2f283c1e-adad-97c5-cc7c-2f0cf4f67150@quicinc.com>
References: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
 <20220308003745.3930607-4-quic_jaehyoo@quicinc.com>
 <700af02b-a220-495f-861a-af10f30b482a@www.fastmail.com>
 <2f283c1e-adad-97c5-cc7c-2f0cf4f67150@quicinc.com>
Date: Wed, 16 Mar 2022 16:15:34 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 16 Mar 2022, at 15:35, Jae Hyun Yoo wrote:
> Hi Andrew,
>
> On 3/15/2022 8:33 PM, Andrew Jeffery wrote:
>>=20
>>=20
>> On Tue, 8 Mar 2022, at 11:07, Jae Hyun Yoo wrote:
>>> From: Johnny Huang <johnny_huang@aspeedtech.com>
>>>
>>> Add FWSPIDQ2 (AE12) and FWSPIDQ3 (AF12) function-group to support
>>> AST2600 FW SPI quad mode. These pins can be used with dedicated FW
>>> SPI pins - FWSPICS0# (AB14), FWSPICK (AF13), FWSPIMOSI (AC14)
>>> and FWSPIMISO (AB13).
>>>
>>> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>> ---
>>>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>> index 54064714d73f..80838dc54b3a 100644
>>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>> @@ -1236,12 +1236,17 @@ FUNC_GROUP_DECL(SALT8, AA12);
>>>   FUNC_GROUP_DECL(WDTRST4, AA12);
>>>
>>>   #define AE12 196
>>> +SIG_EXPR_LIST_DECL_SESG(AE12, FWSPIQ2, FWQSPI, SIG_DESC_SET(SCU438,=
 4));
>>>   SIG_EXPR_LIST_DECL_SESG(AE12, GPIOY4, GPIOY4);
>>> -PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, GPIOY4));
>>> +PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIQ2),
>>> +	  SIG_EXPR_LIST_PTR(AE12, GPIOY4));
>>>
>>>   #define AF12 197
>>> +SIG_EXPR_LIST_DECL_SESG(AF12, FWSPIQ3, FWQSPI, SIG_DESC_SET(SCU438,=
 5));
>>>   SIG_EXPR_LIST_DECL_SESG(AF12, GPIOY5, GPIOY5);
>>> -PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, GPIOY5));
>>> +PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIQ3),
>>> +	  SIG_EXPR_LIST_PTR(AF12, GPIOY5));
>>> +FUNC_GROUP_DECL(FWQSPI, AE12, AF12);
>>=20
>> The idea behind the quad group was not to define a function for it
>> specifically, but to re-use the FWSPID function and select the specif=
ic
>> group associated with the specific style of SPI bus you desire. This
>> way you'd have a pinctrl node like:
>>=20
>> pinctrl_fwqspi_default =3D {
>>      function =3D "FWSPID";
>>      group =3D "FWQSPI";
>> };
>>=20
>> (note the lack of 'Q' in the function name)
>>=20
>> Maybe that's an abuse of groups, but I don't see a need for the
>> function name to match the group name here, we're still doing SPI.
>>=20
>> This can be seen in the DTS fix that Joel sent (disregarding the mixed
>> voltage pins problem).
>>=20
>> Thoughts?
>
> As you said, FWSPID function in existing code is defined as two groups.
>
> GROUP_DECL(FWSPID, Y1, Y2, Y3, Y4);
> GROUP_DECL(FWQSPID, Y1, Y2, Y3, Y4, AE12, AF12);
>
> In case of the FWSPID group, it defines Y1, Y2, Y3 and Y4 pin pads as
> FWSPI18 pins which can be multiplexed with eMMC so pinctrl driver sets
> SCU500[3] when we select this group. Also, if we select FWQSPID group,
> it additionally set AE12 and AF12 pin pads as FWSPIDQ2 and FWSPIDQ3 but
> these two pins are actually part of FWSPI function group that are
> exposed as dedicated pins on AST2600 SoC.
>
> Joel's patch can fix below pin mux setting error since there was a bug
> in aspeed-g6-pinctrl.dtsi.
>
> [    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid=20
> function FWQSPID in map table
>
> But it doesn't fix an improper group selection in pinctrl-aspeed-g6
> driver.
>
> As we saw above, SCU500[3] bit will be set even when we select FWQSPID
> group, and it's described in datasheets like below.
>
> SCU500[3]
>    Boot from debug SPI (OTPSTRAP[2])
>    0: Disable (default)
>    1: Enable
>    Enable this bit will set CPU to boot from SPI that is attached on p=
ins
>    FWSPI18*. This strap will not work when secure boot or boot from Ua=
rt5
>    is enabled. This bit is for verification and testing only. Please
>    don=E2=80=99t enable the OTPSTRAP[2] and protect it by setting OTPC=
FG30[2]=3D1
>    and OTPCFG28[2]=3D1 if there are security concerns.
>
> So if we set this bit once, BMC boot path will be immediately switched
> to FWSPI18 pins when we don't enable secure boot, and it breaks BMC
> booting. I observed this issue in my board and AST2600 EVB too.

Yep, this needs to be fixed.
>
> It's not just interface voltage level issue but also boot failure issue
> if a board uses dedicated FWSPI pins (AB14, AF13, AC14, AB13).

Okay, I wasn't across that part :)

>
> To fix the issue, this commit removes FWQSPID group from FWSPID
> function, and adds FWQSPI function and group to enable just AE12 and
> AF12 as FWSPIDQ2 and FWSPIDQ3 to use them with FWSPICS#, FWSPICK,
> FWSPIMOSI and FWSPIMISO pins.

Okay, probably wrote what I meant in a confusing way. I understand what=20
you've described, but what I was trying to suggest was instead of=20
creating a "FWQSPI" function and group was to instead have just the=20
"FWSPI" function to be used with both the "FWSPI" and "FWQSPI" groups.=20
This aligns with how the FWSPID function/groups work.

Andrew
