Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF13B5F74
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Jun 2021 15:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD8Kd663Xz30DR
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Jun 2021 23:56:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PNCFkZdj;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PNCFkZdj; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD8KV542mz3035
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Jun 2021 23:56:29 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id
 d21-20020a9d72d50000b02904604cda7e66so17069226otk.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Jun 2021 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MlExkp7hP/ylcrzSxL7T+dFTODfyxl0iT59Y7w//6AI=;
 b=PNCFkZdjcjZ3XtS8w2YFVrtLgcKI/EFdDyvCxgjOS+ctap0ccxNMlhF4Cy+YRzm+GX
 qApU/qgxnokyePZEhsKCUuRjwXPD0gmHmh5l3v/OJVoUNEbr7n4Ufn001SgBJl7TVw2z
 1/29AAY/A29+WhFvFeX1biGb71YYdwq412ZJB+/dNGIT6+Zey5l4ecqrezi3JNQ6xOwe
 nlMdcqlmoWobYRas1Ge1zr9V/GIymXSB9yQ9aJI0xC1XOl8O4Z+KzZuwvZ7lBYQIyslh
 wAOWmTnAPpevqNBHw1tPfDXyiqPDIA2ekQJlAnLkQ3DT/YsH5SryerD7phAX9DZGSo0m
 kt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MlExkp7hP/ylcrzSxL7T+dFTODfyxl0iT59Y7w//6AI=;
 b=UuHFxx6tAFC9CYDvrJ277Nc/aNBLwXpki1oFACSBZ7bTRLyZokkDR6diFglgCqpZQ2
 hF0tQVH25RZF8wN+yihSZU9Z7gVgu7c7bzH4OCEJGN+IOnuakD0+w/9GjGr8n4cDG/Wl
 JYOLbotstjjd9ubUU/+MCM/2XKNo+HilR8lQCmbR1Lc2xBiM81pGuAO7751Iptl0MOPF
 OM8wtpt1b+OgOjCjleyJQEU5GfwsBNHEvVt3z6ARyklPd5K1sSATtHZEnb9yF1GJmjvR
 0XdbYsCVuU/0FDvyHN2jr3aM6CZLOyhUrIyiogGs9S91Hw7QjkmstgCx9p4BrIYND65D
 6sXg==
X-Gm-Message-State: AOAM533+jBuAsosr3YnfHMhzTffCKHxYCyzZnfso6U1lOg3MugUljxhZ
 WTcr/RC6rnJr2R++7fE6Cb1eiOdK4fo=
X-Google-Smtp-Source: ABdhPJz7CrhyeVBx+daUx8mvU1U+EBy6hdRC8vefO5jyXcZa8GFDHCgAnMmsF0F6kyEPv3CbPjFwjA==
X-Received: by 2002:a9d:6545:: with SMTP id q5mr22048969otl.268.1624888586144; 
 Mon, 28 Jun 2021 06:56:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j14sm3447071otn.18.2021.06.28.06.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 06:56:25 -0700 (PDT)
To: Billy Tsai <billy_tsai@aspeedtech.com>
References: <20210624035821.25375-1-billy_tsai@aspeedtech.com>
 <20210624124428.GB1670703@roeck-us.net>
 <51093C5F-61E2-4155-9C9A-035E330AEA1E@aspeedtech.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Using falling edge.
Message-ID: <43b0c30c-949a-8a6f-268f-c2a550fca30d@roeck-us.net>
Date: Mon, 28 Jun 2021 06:56:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <51093C5F-61E2-4155-9C9A-035E330AEA1E@aspeedtech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 6/24/21 8:35 PM, Billy Tsai wrote:
> On 2021/6/24, 8:44 PM, "Guenter Roeck" <groeck7@gmail.com on behalf of linux@roeck-us.net> wrote:
> 
>      On Thu, Jun 24, 2021 at 11:58:21AM +0800, Billy Tsai wrote:
>      >> The tach shouldn't use both edges to measure. When the tach input
>      >> duty cycle isn't 50% the return value will inaccurate.
>      >>
>      > A tachometer doesn't have a duty cycle. A pwm has a duty cycle, but that
>      > is completely independent of the pwm duty cycle used to set the fan speed.
>      > So this patch does not really make sense with the above explanation.
> 
> The duty cycle means the waveform that reported from the fan tach pin not pwm signal.
> 
>      > The impact of this patch is likely that the reported fan speed is reduced
>      > by 50%. It may well be that the driver currently reports twice the real fan
>      > speed. I have no idea if that is the case, but if it is it should not be
>      > conditional. The description above states "when the tach input cycle isn't
>      > 50%", suggesting that this is conditional on some other configuration.
>      > I don't know what that might be either.
> 
> According to the tach mode, our tach controller will sample the time of once conditional meet and translate it to tach value.
> When the tach signal duty cycle isn't 50%, using both edges mode will get the tach value with error rate.
> In addition, the current report value of both edges will twice the result which will enlarge the error rate.
> Actually, the tach signal won't be a complete 50% duty cycle, so both edges mode isn't recommanded for the fan usage.
> With rising-to-rising mode the skew time of tach signal will also effect the accuracy.
> Thus, using the falling-to-falling mode is the better way for a fan tach monitor.
> But for flexibility, I think using dts property to control the tach mode is better the user can change the mode to adapter the monitor device.
> 

Trying again, using my own words.

A fan normally provides two short pulses per revolution. Those are short
puleses, and one does not typically talk about "duty cycle" or "waveform"
in this context. The driver currently counts both edges of those pulses.
Assuming that a fan reports, say, 1,000 pulses per minute, the hardware
would report a edle count of 2,000. This should translate into 500 RPM.
I don't know if this is currently the case in the driver; if not, it would
be a bug. Either case, the suggested change would reduce the pulse count
reported by the hardware to 1,000. If we assume that the driver currently
translates this correctly to 500 RPM, the suggested change would result
in the driver reporting 250 RPM, which would be wrong.

So there are two possibilities:
1) The driver currently reports 1,000 RPM in this situation. This would be a bug
    which needs to get fixed.
2) The driver currently correctly reports 500 RPM. In this case, the suggested
    patch would introduce a bug because the code is not adjusted for the reduced
    pulse count.

The problem is that the patch does not address either of the situations above.
In case 1), it should state that the code currently reports twice the real
fan speed, and that the patch fixes that problem. In case 2), the patch should
also fix the arithmetic used to calculate RPM from the pulse count.

Either case, I disagree that this should be handled in devicetree. It has
nothing to do with hardware description or configuration but is in the
discretion of the driver author/implementer.

Guenter
