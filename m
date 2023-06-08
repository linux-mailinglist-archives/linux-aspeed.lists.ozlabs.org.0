Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A062072836B
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 17:16:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcSTc05LGz3f0C
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jun 2023 01:16:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.171; helo=mail-il1-f171.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcSTW6PPvz3dx8
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Jun 2023 01:15:59 +1000 (AEST)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-33bdab7b4caso2253035ab.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 08:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686237355; x=1688829355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdr6h3xlT0s10AAMIzoAd0fqH1qnHaQu9PS8cpJiPSU=;
        b=IqqA17Si5lxPkh4CgA/leO1Iemz35kGUmIX+yZ00JfIF/ulxCR6Lt1PVv7rrmphl/b
         xxqXOVhD/lQ96ODA76J+0674mdcRxvQW3ETmX83qLVUOAG5o++KsXTyP4dF/jlxC/Q29
         iL5SpQdGkHfMlRUthHVobQdUSmQQ1FIk8ra9hevJfWuXZP4JSLM2M3oGJrXCvxjz14dz
         x9R0jJ7JxSgrdX7KTp4H+JX04GFNJwoEI1hDQF1HmAU6+dBpgPulP14d8iZ/uLRI/ACa
         T2D6Nh0LuECYZs+8PZmdyg9sOACDC9Sg34+SJFCjStWFw1QkwfJ7EYnZOSmxWohxsvl7
         koVA==
X-Gm-Message-State: AC+VfDyanRsc2pUxnnSb+e7X4HrpFwslKSTeuHsQXjv4RTCvScPDB+uT
	mmQ91CD0rKTkX389HEYatA==
X-Google-Smtp-Source: ACHHUZ6c2mDobEqawXg5KuKKk2m3x3XmcmpQemI8k7rhvj+ZPU82e1c5pml2iLfIZD4VQEX7S6da+g==
X-Received: by 2002:a92:c98f:0:b0:331:1f0e:79b8 with SMTP id y15-20020a92c98f000000b003311f0e79b8mr6879652iln.0.1686237355131;
        Thu, 08 Jun 2023 08:15:55 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p5-20020a92d285000000b00333b5ae4ab7sm439825ilp.87.2023.06.08.08.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 08:15:54 -0700 (PDT)
Received: (nullmailer pid 2700534 invoked by uid 1000);
	Thu, 08 Jun 2023 15:15:52 -0000
Date: Thu, 8 Jun 2023 09:15:52 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Message-ID: <20230608151552.GA2637361-robh@kernel.org>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
 <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
 <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
 <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 06, 2023 at 04:23:52PM +0200, Krzysztof Kozlowski wrote:
> On 06/06/2023 16:06, Patrick Williams wrote:
> > On Tue, Jun 06, 2023 at 12:49:04PM +0200, Krzysztof Kozlowski wrote:
> > 
> > Hi Krzysztof,
> > 
> > Thank you for reviewing this from Billy.
> > 
> > The Aspeed chip is heavily used by the OpenBMC community and the 2600
> > has been used in production systems for almost 2 years now.  Many
> > companies are having to carry previous versions of these as patches, and
> > some of the APIs changed since the last revision from Billy.  So, I had
> > asked him to submit the latest patch set with as many revisions as he
> > understood what to change, since the conversation seemed to have died
> > since last time he submitted.  
> > 
> > I don't believe Billy is intentionally ignoring your feedback and he is
> > motivated to get this patch set wrapped up into an acceptable state.
> > 
> >> On 06/06/2023 11:45, Billy Tsai wrote:
> >  
> >> NAK. You got here clear comment. You cannot have simple MFD with
> >> resources. It is not simple anymore.
> >>
> > 
> > In fairness, Billy asked for clarification from you on this point and didn't
> > receive it.
> > 
> > https://lore.kernel.org/lkml/24DD1FEB-95F3-47BE-BE61-8B0E6FBDE20F@aspeedtech.com/
> 
> I gave the instruction what Billy should do:
> 
> https://lore.kernel.org/lkml/41500a04-b004-0e2c-20a1-3a3092b90e6d@linaro.org/
> 
> What about other ignored comments? About subject, quotes and more? Even
> if this one was unclear, then why ignoring all the rest?
> 
> > 
> > He felt what he was trying to accomplish met the documented
> > expectations.  Are there some changes that need to be done in mfd.txt to
> > further clarify when to use it and when not to?
> 
> I think mfd.txt clearly states:
> "For more complex devices, when the nexus driver has to
> probe registers to figure out what child devices exist etc, this should
> not be used. In the latter case the child devices will be determined by
> the operating system."
> 
> Also, repeated many times:
> https://lore.kernel.org/all/YXhINE00HG6hbQI4@robh.at.kernel.org/
> https://lore.kernel.org/all/20220701000959.GA3588170-robh@kernel.org/
> https://osseu2022.sched.com/event/15z0W

I've probably said this already, but any 'fan controller' needs to 
define a common fan binding that works for multiple scenarios. There's 
been some attempts in the last year which seems to have stalled out.

Rob
