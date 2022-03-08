Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A14D0D2E
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 02:03:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCHBW1FvXz3bNs
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 12:03:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=cYCI3SQv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gIthevPK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=cYCI3SQv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gIthevPK; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCHBL6ZBfz2xBV
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Mar 2022 12:03:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 403395C0278;
 Mon,  7 Mar 2022 20:03:04 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Mon, 07 Mar 2022 20:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=+exSsSKAiC7Evi9rH2ZTNIwfg5fo7D3S8bypoA
 Qltjg=; b=cYCI3SQv3HxNbowwApY+kJr9n1SzprCyTNRe9pxZgaxs0JbD7uKlL2
 fCqfTc5xxWLM0U0W59WgyiSfkETEIAM+mOSvxTAvxvKr0BWT3ilKHLCXktkymq97
 Lzh7ED3Tv2NXTYIURUdSVoVo0YLlnPs4BeAHHzhcuBcMqh1F6Nv5vylmUI2HI1Me
 DT2ltn7USpGmk3VEy5WlervZTy7faiVGQxlJJqnOq3utkQl4vaYYm2jFMWbjgZlr
 lLlS97hkyBxAqkAJzJKksJ+YVI9HWoHblpSJsaC5SAs0Y6Nbm95NmzEpYi1rr+Q9
 rmDZBmFsEi0Ck1udsnvQkBEJchf0ZqLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+exSsSKAiC7Evi9rH
 2ZTNIwfg5fo7D3S8bypoAQltjg=; b=gIthevPKFrRttwUEPPBiS4d5xYyXinU6u
 Wa4YB1uQ+gZp0QdRdYQPGNDVNagSz8YzhEJUn9+k+OHb9Yd004g4SotPYHrY4HRS
 koR/VZ0aXrEtXlaxt+8wq3hqBR9K8QXlKXsrVG20InYw9vYzsPfKzZkKtqE6P1m5
 TsmZLKz5PPnjMnllGkbC84/x7/rFGFSwZQYc9UUZUBwmMrMB2CrtJcRiLA8/d6Kg
 J/MLE9mKXZN/gpIkLQWFJEYaRNaeQTVH1rliPv2LuTSK4nW9P+9yeCE5mQauSXa9
 0LFMxmWfORThbyoNg23N9/nlUFRSIc334pD7P+zTvjzqjb2+AphuQ==
X-ME-Sender: <xms:R6smYgdZY38lRUGGqmQqNPD67CiJ9HlWDy0sDp1niD9NUXsuwAgFmQ>
 <xme:R6smYiNOs-un3uct8Rr6U1xmfLE8iiR626BmLIIqs2_h4hqVLLNS8mAG4t-0rn3Pw
 mTugOS9pplvEdCz9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduhedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:R6smYhgPMM3PmTtbakJG57DCwp-n0xcy5dDaWsyuKpr7V1ZdLScW8g>
 <xmx:R6smYl9pCYpQTEXDts7n5AG26vELVJk02x1BYXJPhyxt14Yc3ClCHg>
 <xmx:R6smYsv7hPwb9cuAN-Mo2izvmlw1PNaJD3SYfQd3YtXlPT9NOZsQcQ>
 <xmx:SKsmYh-naLmtWNWI1vapLKJ6uFkafPC8qTraY3Lyaa8Ggga8fvT2UQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5EC0DF6007E; Mon,  7 Mar 2022 20:03:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <e541828f-f0bc-419a-a5fc-d8aefe97832d@www.fastmail.com>
In-Reply-To: <73a487ed-312b-72b3-4e64-dc580ba80704@quicinc.com>
References: <20220308003136.3930466-1-quic_jaehyoo@quicinc.com>
 <d2f125d8-07d1-4bff-8718-7dfba4d8fdb3@www.fastmail.com>
 <73a487ed-312b-72b3-4e64-dc580ba80704@quicinc.com>
Date: Tue, 08 Mar 2022 11:32:43 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: Add FWQSPI pinmux
Content-Type: text/plain
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



On Tue, 8 Mar 2022, at 11:16, Jae Hyun Yoo wrote:
> Hi Andrew,
>
> On 3/7/2022 4:41 PM, Andrew Jeffery wrote:
>> 
>> 
>> On Tue, 8 Mar 2022, at 11:01, Jae Hyun Yoo wrote:
>>> From: Johnny Huang <johnny_huang@aspeedtech.com>
>>>
>>> AST2600 FW SPI quad mode only need to set AE12 and AF12, no need
>>> to set Y1~Y4. FW SPI cs, clk, mosi and miso pins are dedicated.
>> 
>> They're not dedicated according to the datasheet?
>> 
>> Can you please look at this patch?
>> 
>> https://lore.kernel.org/all/20220304011010.974863-1-joel@jms.id.au/
>
> Sorry. Please ignore this patch.
> I mistakenly sent this patch while making a patch series.
>
> Please check this patch series instead.
> https://lore.kernel.org/linux-arm-kernel/20220308003745.3930607-1-quic_jaehyoo@quicinc.com/T/#t

No worries, I'll take a look though it might be a couple of days due to chasing some other issues.

Andrew
