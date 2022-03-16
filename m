Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADAD4DAA7B
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 07:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJKgN2Dgtz30Dk
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 17:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=LPEJXA5o;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DxaCkxRw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=LPEJXA5o; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=DxaCkxRw; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJKgG707Wz2yQG
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Mar 2022 17:12:10 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 018585C00D0;
 Wed, 16 Mar 2022 02:12:08 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Wed, 16 Mar 2022 02:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=F5pL2KHL4n0aMu
 847nnrHGO3av4yWeplTZO11e2ZVhw=; b=LPEJXA5oYNdEKzS0c1uxowB6yK9rhp
 pqp8Qy2USt9KW3o0kqtwQ3ezS13D+XYH1SE48CmE7cTeTPA+oxKOp3LI31NkTWVm
 Tc/mzHwT0+URQiJJAPdLHxs/4jgxD5kw2Fm4zQxYYxrm/e230v57MOH3hHYIb7vp
 KkOllttpPehrX/ZhCfAa4J1hZKaYcNmoAJZWj4urKzjlHpYpHqRhx6Pv794yR1IW
 sP9GL+SwIRb1Tui7UxK2M/o/c9y/siiiD+XBU0d/LCOF1cc7g47VFRinJd7LQ2wm
 AGFJQqCs0sbxg8MbkBTZTFYBAc3+tvSsYmRCrjA26gELwj18ZdK9YoGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=F5pL2KHL4n0aMu847nnrHGO3av4yWeplTZO11e2ZV
 hw=; b=DxaCkxRwNIqRVw5SBSOB8W05sWyxilsuBymOfu1JqLhr2e24Xb1UL+Sys
 PeCLe4SmWragDWnH9gTyaLXeL89X78dbS9K/aYBu3F+y8l14+4SHG55LiEJR5WDM
 Rc4oY/0WMrpbb0Dbqz0igGoam3q3jdfF59XXWMbsjFZ70LKZMnqEavBLi7yWKram
 U2VEPEVQrXdoP8JKlQ3uKiWgMhqRzwa5jV9xXki/Xxh44a23QEnLTPFS0AD9xV0e
 FjLoTFlsf2gpkQh8sNgb4itUtDmiec/A3icwaX7BTeQ/b29kZ+He3o/EVfafxEf7
 Ob/mfKdZHOd+smotBZhgVW3eJuUhA==
X-ME-Sender: <xms:t38xYirxQ7avz2IX_hhyy57FUTLhJnhQ_egk9U8BDmfmlaVCWMs9Wg>
 <xme:t38xYgqHR6wOU6jiE0KfFfaA4tpEwB2SNpDOTVqITRb3vQQoT34QZDGIRqoSZXxjm
 BZKfGx2gqwf7bdUPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefuddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:t38xYnPTX77pDN1deQSEb7iNGPnX3ixb44N4QhB6OLKAIYo3_H50Pw>
 <xmx:t38xYh7GrRNoPLhswB6mcd0pOFAnsFClnitrzCdxhCU6py_J0zf6HA>
 <xmx:t38xYh4T6GR0AdXqcZ3Lnr4FBFSVYHtBcSC3BL8o1-KEbXJ4Jd_66A>
 <xmx:t38xYsbnKDBEGPOiZF2D8hd_Nrf5ueFq38yzpiFxXMoJyvxrq09cIA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 90925F6007E; Wed, 16 Mar 2022 02:12:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4907-g25ce6f34a9-fm-20220311.001-g25ce6f34
Mime-Version: 1.0
Message-Id: <2e534b24-12bf-4bfe-ab4d-566710aa03fa@www.fastmail.com>
In-Reply-To: <c75e49ad-8b1d-7cf3-19ec-26c65d7da05c@quicinc.com>
References: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
 <20220308003745.3930607-4-quic_jaehyoo@quicinc.com>
 <700af02b-a220-495f-861a-af10f30b482a@www.fastmail.com>
 <2f283c1e-adad-97c5-cc7c-2f0cf4f67150@quicinc.com>
 <3056f002-4d9a-461e-8a29-12b6742e99fb@www.fastmail.com>
 <c75e49ad-8b1d-7cf3-19ec-26c65d7da05c@quicinc.com>
Date: Wed, 16 Mar 2022 16:41:46 +1030
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



On Wed, 16 Mar 2022, at 16:33, Jae Hyun Yoo wrote:
> On 3/15/2022 10:45 PM, Andrew Jeffery wrote:
>>=20
>>=20
>> On Wed, 16 Mar 2022, at 15:35, Jae Hyun Yoo wrote:
>>> Hi Andrew,
>>>
>>> On 3/15/2022 8:33 PM, Andrew Jeffery wrote:
>>>>
>>>>
>>>> On Tue, 8 Mar 2022, at 11:07, Jae Hyun Yoo wrote:
>>>>> From: Johnny Huang <johnny_huang@aspeedtech.com>
>>>>>
>>>>> Add FWSPIDQ2 (AE12) and FWSPIDQ3 (AF12) function-group to support
>>>>> AST2600 FW SPI quad mode. These pins can be used with dedicated FW
>>>>> SPI pins - FWSPICS0# (AB14), FWSPICK (AF13), FWSPIMOSI (AC14)
>>>>> and FWSPIMISO (AB13).
>>>>>
>>>>> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
>>>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>>>> ---
>>>>>    drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 11 +++++++++--
>>>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>>>> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>>>> index 54064714d73f..80838dc54b3a 100644
>>>>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>>>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>>>>> @@ -1236,12 +1236,17 @@ FUNC_GROUP_DECL(SALT8, AA12);
>>>>>    FUNC_GROUP_DECL(WDTRST4, AA12);
>>>>>
>>>>>    #define AE12 196
>>>>> +SIG_EXPR_LIST_DECL_SESG(AE12, FWSPIQ2, FWQSPI, SIG_DESC_SET(SCU43=
8, 4));
>>>>>    SIG_EXPR_LIST_DECL_SESG(AE12, GPIOY4, GPIOY4);
>>>>> -PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, GPIOY4));
>>>>> +PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIQ2),
>>>>> +	  SIG_EXPR_LIST_PTR(AE12, GPIOY4));
>>>>>
>>>>>    #define AF12 197
>>>>> +SIG_EXPR_LIST_DECL_SESG(AF12, FWSPIQ3, FWQSPI, SIG_DESC_SET(SCU43=
8, 5));
>>>>>    SIG_EXPR_LIST_DECL_SESG(AF12, GPIOY5, GPIOY5);
>>>>> -PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, GPIOY5));
>>>>> +PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIQ3),
>>>>> +	  SIG_EXPR_LIST_PTR(AF12, GPIOY5));
>>>>> +FUNC_GROUP_DECL(FWQSPI, AE12, AF12);
>>>>
>>>> The idea behind the quad group was not to define a function for it
>>>> specifically, but to re-use the FWSPID function and select the spec=
ific
>>>> group associated with the specific style of SPI bus you desire. This
>>>> way you'd have a pinctrl node like:
>>>>
>>>> pinctrl_fwqspi_default =3D {
>>>>       function =3D "FWSPID";
>>>>       group =3D "FWQSPI";
>>>> };
>>>>
>>>> (note the lack of 'Q' in the function name)
>>>>
>>>> Maybe that's an abuse of groups, but I don't see a need for the
>>>> function name to match the group name here, we're still doing SPI.
>>>>
>>>> This can be seen in the DTS fix that Joel sent (disregarding the mi=
xed
>>>> voltage pins problem).
>>>>
>>>> Thoughts?
>>>
>>> As you said, FWSPID function in existing code is defined as two grou=
ps.
>>>
>>> GROUP_DECL(FWSPID, Y1, Y2, Y3, Y4);
>>> GROUP_DECL(FWQSPID, Y1, Y2, Y3, Y4, AE12, AF12);
>>>
>>> In case of the FWSPID group, it defines Y1, Y2, Y3 and Y4 pin pads as
>>> FWSPI18 pins which can be multiplexed with eMMC so pinctrl driver se=
ts
>>> SCU500[3] when we select this group. Also, if we select FWQSPID grou=
p,
>>> it additionally set AE12 and AF12 pin pads as FWSPIDQ2 and FWSPIDQ3 =
but
>>> these two pins are actually part of FWSPI function group that are
>>> exposed as dedicated pins on AST2600 SoC.
>>>
>>> Joel's patch can fix below pin mux setting error since there was a b=
ug
>>> in aspeed-g6-pinctrl.dtsi.
>>>
>>> [    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid
>>> function FWQSPID in map table
>>>
>>> But it doesn't fix an improper group selection in pinctrl-aspeed-g6
>>> driver.
>>>
>>> As we saw above, SCU500[3] bit will be set even when we select FWQSP=
ID
>>> group, and it's described in datasheets like below.
>>>
>>> SCU500[3]
>>>     Boot from debug SPI (OTPSTRAP[2])
>>>     0: Disable (default)
>>>     1: Enable
>>>     Enable this bit will set CPU to boot from SPI that is attached o=
n pins
>>>     FWSPI18*. This strap will not work when secure boot or boot from=
 Uart5
>>>     is enabled. This bit is for verification and testing only. Please
>>>     don=E2=80=99t enable the OTPSTRAP[2] and protect it by setting O=
TPCFG30[2]=3D1
>>>     and OTPCFG28[2]=3D1 if there are security concerns.
>>>
>>> So if we set this bit once, BMC boot path will be immediately switch=
ed
>>> to FWSPI18 pins when we don't enable secure boot, and it breaks BMC
>>> booting. I observed this issue in my board and AST2600 EVB too.
>>=20
>> Yep, this needs to be fixed.
>>>
>>> It's not just interface voltage level issue but also boot failure is=
sue
>>> if a board uses dedicated FWSPI pins (AB14, AF13, AC14, AB13).
>>=20
>> Okay, I wasn't across that part :)
>>=20
>>>
>>> To fix the issue, this commit removes FWQSPID group from FWSPID
>>> function, and adds FWQSPI function and group to enable just AE12 and
>>> AF12 as FWSPIDQ2 and FWSPIDQ3 to use them with FWSPICS#, FWSPICK,
>>> FWSPIMOSI and FWSPIMISO pins.
>>=20
>> Okay, probably wrote what I meant in a confusing way. I understand wh=
at
>> you've described, but what I was trying to suggest was instead of
>> creating a "FWQSPI" function and group was to instead have just the
>> "FWSPI" function to be used with both the "FWSPI" and "FWQSPI" groups.
>> This aligns with how the FWSPID function/groups work.
>
> FWSPI pins are dedicated pins just for boot firmware SPI interface so
> these pins don't need any pinmux setting. We just need to add pinmux
> setting of AE12 and AF12 for a case when FWSPI needs QSPI support with
> having these additional data pins. Do we need to define two groups
> including a dummy group for the dedicated pins? Can you please share
> more details of your idea? I don't see any example of dedicated pins in
> the driver.

Ah, yeah, if they're fixed pins then we don't need to worry about them=20
in pinmux, in which case we only have the one group. I'm getting there=20
slowly :)

I'll look over the patch again.

Andrew
