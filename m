Return-Path: <linux-aspeed+bounces-138-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3C9D1D49
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Nov 2024 02:28:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xsn1S5jkCz2xFk;
	Tue, 19 Nov 2024 12:27:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731979676;
	cv=none; b=EApv/u6aaIvXqPPiP3cxQSeA5SRT2eUOnpzkuABiuK0+xFBBQ0EM6igK+nwg+ZMfeuNjbsMmj/OqZA8IU2gCQsk4TqL8MlU9VdpmNwB1slQqOMcmmQOf5JIT3Zo+OEy3F0JAhBrfrZY4RltTbxYHLV5O7yLiON1PiARJgraJ3YJdvJraQ0r92pQrnbUWZOrHynuK9c+bUdIzzRJP5qqh1edwTtSO+SbdbIDn+uZQHs+UXPgtDB4eJSpBprW4vQGWJt9z5isIDd/WlTH39gQsbIK2lyjJAuggWjt3yN3RTbJMnR+3PoBK+GwU6aukvS7HqmRHA29YLlUAr+I9K3M8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731979676; c=relaxed/relaxed;
	bh=4ZorpfKuUeGuivvgx/Z+J1Gge5l/P7+qrV0/mMG9I6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxHk/M1Fifbq5MNtB946jzMkoWkKKbYjMwnJoVInwCWXW4mo03v3ZuIiOl0g6DsKIeyEopvHR/X5vnCrqdYpyDXFqWGne1o0N1U3Tj2344xr5mberCkRQ3ja4j0Tb1I1O6BMmBo0CLAxxoB5G7J8Gdbdwd0Wbn5qggPq0siYhshUROhgEQUPU1ygKIVZjEJRYCg2hdi4JGP1bwaN4+5zPz0R/ncCUsMD8PmVOEfOHXDg2c6n7DUVE5EvB0YI7rU4kHZ9A12GUdW0nll+SlsqppeS5Al3iKTiKPFCpavhDQzmV98gfuppSZdi4IxXvbhMBmYmwWMZn51xa0B0LI0H4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UK71yilA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UK71yilA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xsn1Q3TDSz2xBK
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Nov 2024 12:27:52 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-211fb27cc6bso21735315ad.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Nov 2024 17:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731979668; x=1732584468; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZorpfKuUeGuivvgx/Z+J1Gge5l/P7+qrV0/mMG9I6Q=;
        b=UK71yilAa4dAfCTX0liY9ex99lQ/sl+VWA12FWsl/GectuG9SmfDj2U+eVNHdhZ9em
         icfKiFsdY2EWc0bMehyXFESYRQgkC/ZlZn5zJX0vqfZrlrobJBrZppUnQBa0LLPQP55a
         HxEQf6acnbpvW9TKg02PrwHXLoXGHK9hDVEko/rfNtj9mcUPIGtC5q787iysmlK3hgkk
         eHx/aTBqbtJmRRT8GtjWJUlxJQyn5A2SAlJCHtY3LOm/Nhc8J1lYwRXcHbpz4DSx2MJG
         d1KEmcntDYjOhoO6/g0ErG2eaXvMEcK6ZKjEUt42MyDL4dbsJzFbaC2znCkzgEp1NdX0
         9NHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731979668; x=1732584468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZorpfKuUeGuivvgx/Z+J1Gge5l/P7+qrV0/mMG9I6Q=;
        b=B03vi4rUrKc59VITLH+mPKqClRU/1PBetnWZ+UuOTcg4MK8UMsxgZAr6era6DjmBUE
         AWv4avcjX6bu3rkqwwm2X6fU0P3kO52N+4UyzLD2FhdFvnurp46akDivY7Ddu9Cq7vKW
         AKRQREhK7fKl/J2k1tSPYU6HIgtdaQzyRqVB+a18OnNSJDRZBnutUUtCe4u7jMxpEtf6
         BWp/8/Q4wLnqWS0mvKjT2kPwwOqVo2CrtW0zRH7oK6jrwKVDInqGnU6fxArHy94bibQa
         n7QGhqnorfWlLeM+fsglKOfNyk5WLP5XfzVVmjINtWcKnhLDCxhuPUecDQS9+scPKe17
         i/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUxgt26nA8nTTIlog0YvYfwWJxL2r4grOSTGi3RwCs4kDVk0mTUp/f09/hinSWI5WnHgKrWL0LEAGcAUis=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwB48TUeJai/N9HAQEky/p17nUTtZmXw91Ww4ewnsiXCyH6vI53
	2uGEfExEMf3chipbXSaNtjv4LX7h3QcszI+4QZydZp3I+PjVNfp+
X-Google-Smtp-Source: AGHT+IGVmuyorAWRkpmodzfyjWX00rOtHkl4LsRbCrNu/DpwLEEoRin3/dPBpX0eN9YNURbS8cJqhA==
X-Received: by 2002:a17:902:d4d0:b0:20c:5bdc:c228 with SMTP id d9443c01a7336-211d0d6e7d6mr161345145ad.13.1731979668390;
        Mon, 18 Nov 2024 17:27:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea3394287fsm5682773a91.31.2024.11.18.17.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 17:27:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
Date: Mon, 18 Nov 2024 17:27:45 -0800
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
 "Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
 "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
 "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "chnguyen@amperecomputing.com" <chnguyen@amperecomputing.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
 <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/18/24 15:00, Andrew Jeffery wrote:
> On Mon, 2024-11-18 at 12:50 -0800, Guenter Roeck wrote:
>> On 11/18/24 04:46, Chin-Ting Kuo wrote:
>>> Hi Guenter,
>>>
>>> Thanks for the reply.
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
>>>> Roeck
>>>> Sent: Friday, November 8, 2024 10:08 PM
>>>> Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus
>>>> handling
>>>>
>>>> On 11/7/24 21:42, Chin-Ting Kuo wrote:
>>>>
>>>>> But now, I think it will be better to add a patch for creating
>>>>> a new
>>>>> reset reason, e.g., WDIOF_REBOOT or WDIOF_RESTART, in
>>>>> watchdog.h of
>>>>> uapi. Can I include this change, creating a new reset reason,
>>>>> in this
>>>>> patch series? Or, should I create an extra new patch series for
>>>>> this
>>>>> purpose?
>>>>>
>>>>
>>>> This is a UAPI change. That is a major change. It needs to be
>>>> discussed
>>>> separately, on its own, and can not be sneaked in like this.
>>>>
>>>
>>> Agree. However, how to trigger this discussion? Can I just send a
>>> new
>>> patch separately with only this UAPI modification? This is the
>>> first time
>>> I change such common source code.
>>>
>>
>> Yes. That needs to include arguments explaining why this specific new
>> flag
>> even adds value. I for my part don't immediately see that value.
> 
> So maybe I was derailed with my WDIOF_REBOOT suggestion by the proposal
> to repurpose WDIOF_EXTERN1 to indicate a regular reboot. I still don't
> think repurposing WDIOF_EXTERN1 is the right direction. But, perhaps
> the thing to do for a regular reboot is to not set any reason flags at
> all? It just depends on whether we're wanting to separate a cold boot
> from a reboot (as they _may_ behave differently on Aspeed hardware), as
> on a cold boot we wouldn't set any reason flags either.
> 


Thew point here is that this is just a warm reboot which happens to use
the watchdog as vehicle trigger a reset. A UAPI change along that line
would tell the user just that, and I don't see the value in it.

FWIW, the only really valuable flag is WDIOF_CARDRESET. All others are
at best misleading since the watchdog isn't typically involved in
making policy decisions such as WDIOF_OVERHEAT or WDIOF_FANFAULT and thus
can not report such reasons to userspace.

Unfortunately we can at best deprecate all those existing flags. At the same
time I really don't want to introduce new ones unless they provide real value.
While it might be valuable to know if a reboot was a cold or a warm reboot,
the watchdog subsystem is not involved in this either on almost all
platforms, meaning userspace can not really rely on it. Yes, Aspeed
hardware may behave differently, but typically all those differences
would need to be handled in the kernel when (re-)initializing the hardware,
not in userspace.

So, again, what exactly would userspace do with the information that this
was a watchdog triggered warm reboot ? Why would it need that information ?

Thanks,
Guenter


