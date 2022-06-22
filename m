Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE153554D86
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 16:37:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSmDf55cYz3brm
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 00:37:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hfCoQxsS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hfCoQxsS;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSmDV2rZcz3bnY
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 00:36:56 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so17003952pjz.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QPTQnnGMAlX9DR/Wnzz/rHtvgybIf6uKNn+Efoudg+A=;
        b=hfCoQxsSr1AiUPED+rApz5o3D8pO/hGhEKqz4/3wZPQix+70o879IgeDEGHilYZGL6
         HWj1U9BXuM0FK3F/sYqVWRloIUHVtXKz1DdaEaM1rATOLyK0uFm7qEi/C56CZiQoZf8j
         jWG3lft0SgAJuAM4sqOQIBEVsj8A2HEokzEWTLARyhki2+zb/w3ccxPGPBwv+OeFHbDI
         A8XkpMuMz2cJpWJdNxTzZfbI+1gG6vqpS5lTh6Ur4kuznKKm8pMpUoB2YjH30Aa193Zo
         MiRrndHiDJz/C29k6Q/pt/pJrS3J2rGFNbg+jsKPQc/y1Hp98+iCv2psxMTWsQvBboCF
         d/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QPTQnnGMAlX9DR/Wnzz/rHtvgybIf6uKNn+Efoudg+A=;
        b=1bvw6wq79mdLrvM1cYnm4exdmTfdfVig4Z95MeCKvczDBhlXXFZmKfHjhkR8TscZ2W
         tVfuHzIAXnXI8pH50746MUNjlM5YOyjBwpDmPhysI1TJj9Js/+XlpO+qmlnOHT5c9Duq
         jl8M6o7A/DSRSYpb17H/ziaUxIzXNrn9KU35jHPgRWE0jDOarES7vqNlSZOiiIPjUgbs
         5fku+vSuJaVr+4xzp0/TPSUCMU6QPa7b0bgLq2BfVrEZDPPcB1yHlqjj4uNZFLCnUZBY
         IVieEbxFFdfhfp0O8JgsmtVWAQ6ReifmYoXB3+osq+kLm3TqJNpSpEmmZ1ke/57kI2Zt
         JttA==
X-Gm-Message-State: AJIora83C2M9i8HQUiWst1RtfXxsi/1RmqM37Is5vW02vEWbdRa81zZe
	/jDqYcORRNAlX/pkZ4kxn70=
X-Google-Smtp-Source: AGRyM1uLC611EYbwN9PQLKue9M+LWR2/yK9A7/CK60EWV+8yg7Fw2xjQsRI0T++TJXXz0BWWXwB1EQ==
X-Received: by 2002:a17:90b:33c8:b0:1ea:c199:9794 with SMTP id lk8-20020a17090b33c800b001eac1999794mr4104778pjb.224.1655908613363;
        Wed, 22 Jun 2022 07:36:53 -0700 (PDT)
Received: from [192.168.1.24] (1-162-200-193.dynamic-ip.hinet.net. [1.162.200.193])
        by smtp.gmail.com with ESMTPSA id x15-20020a63b34f000000b0040d027e1f0fsm3232444pgt.25.2022.06.22.07.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:36:52 -0700 (PDT)
Message-ID: <eda3f331-6df4-c4d3-33e5-a872fecd6024@gmail.com>
Date: Wed, 22 Jun 2022 22:36:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] Update Facebook Bletchley BMC DTS
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
References: <20220613095150.21917-1-potin.lai.pt@gmail.com>
 <Yqdr1ZS6d71QeACd@heinlein.stwcx.org.github.beta.tailscale.net>
From: Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <Yqdr1ZS6d71QeACd@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


Patrick Williams 於 6/14/2022 12:54 AM 寫道:
> On Mon, Jun 13, 2022 at 05:51:46PM +0800, Potin Lai wrote:
>> Update below items for Facebook Bletchley BMC devicetree.
>>
>> Potin Lai (4):
>>   ARM: dts: aspeed: bletchley: change LED sys_log_id to active low
>>   ARM: dts: aspeed: bletchley: disable GPIOV2 pull-down
>>   ARM: dts: aspeed: bletchley: bind presence-sledX pins via gpio-keys
>>   ARM: dts: aspeed: bletchley: update fusb302 nodes
>>
>>  .../dts/aspeed-bmc-facebook-bletchley.dts     | 197 +++++++++++++-----
>>  1 file changed, 148 insertions(+), 49 deletions(-)
Hi Joel,
Could you help me review this patch series?
Could you also backport this to linux-aspeed 5.15 if everything looks good to you?
Thank you.

Potin
> The whole patch set looks good to me as the closest domain expert to the
> Bletchley system after Potin.
>
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
>
