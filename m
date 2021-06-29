Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6C3B730A
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Jun 2021 15:15:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDlMV4yKhz2yP0
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Jun 2021 23:15:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Lduf+YRF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lduf+YRF; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDlMK2bNmz2yNH
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Jun 2021 23:15:07 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso22588725otu.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Jun 2021 06:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cjpoeExDVoTQk33TVGG8V5XenOGECJoUHQ3xv8jXV0g=;
 b=Lduf+YRFSGDZRfa99b12nFYZp6MB40Cfj2CasYH9jDlr7Oj390Z81FUd97KiMfwVwq
 tRfpVbBXZcn9vdYT25uIWwo0zgZA5e0XCrhwQFX8I43IDNUUC0ijNl8ezZhwcsEw2lc1
 ygs4Xig3fPIfjtAjq1PlmEgrbity+55v6lLFSbwqS9T6HCRZktdPvXpp6+0dT2+cax2o
 ui90fHHVb86IZ+g2JIOljcQiX5VQV9+pYZPUPvuBU2+gAHXijE5Cro4iFZ+B1rxQQ6yR
 YjY1w6bVSfTF4JNqPgGrrFf+cJH/vhRYmYasxdh9JRNF8S/jN5U2RKxmLdnkf/SAxh4V
 Y+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cjpoeExDVoTQk33TVGG8V5XenOGECJoUHQ3xv8jXV0g=;
 b=lBqmmIhqJkIBsN4VliHG9zgxOg+dTt0PI6JrQpupSvqJXsUzEdw6zcIvUbNyvzNpvz
 73uvCRnh9MW1EDSNf6fSVcEeAl3coYuFBSeLAa0+LrDmOK6E2Cp0ryHrHw2ZNw46uutS
 /+ea9icc7UCKbMbq6PFA5x/APZJCqde9rW1nK9Z3ljakFLNGgW2hpsUS08xxGZw9eej7
 x56x6SzoIqWExK5Qp+XEwjKiEDfJgvDgVlXnzNiPWLlFpqMuMyJ28wFhdthPGdKi09vr
 jMKvGhi64fLJ+WeA1dXuNHAjUMyOAnD4P6USS7mdQRQY0NFfA24KFtQDwylUccwnF7lk
 1YjQ==
X-Gm-Message-State: AOAM533Ff/kQysHub2LHmiH2X2tjOt/1xln56p6pbd/Em67vfHzS6Otz
 BfBqs7vkX/cksO9nFDbOBeU=
X-Google-Smtp-Source: ABdhPJyRlNpLuQzVgJPWzuF5+Swtehe2Queq7hf5wR6XIiXzHXha2ry0XkD9BP4hjRW3rLAqNKkdQw==
X-Received: by 2002:a9d:57cc:: with SMTP id q12mr4695576oti.286.1624972502363; 
 Tue, 29 Jun 2021 06:15:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o24sm4113745otp.13.2021.06.29.06.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 06:15:01 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Using falling edge.
To: Billy Tsai <billy_tsai@aspeedtech.com>
References: <20210624035821.25375-1-billy_tsai@aspeedtech.com>
 <20210624124428.GB1670703@roeck-us.net>
 <51093C5F-61E2-4155-9C9A-035E330AEA1E@aspeedtech.com>
 <43b0c30c-949a-8a6f-268f-c2a550fca30d@roeck-us.net>
 <9CFDB695-1F7C-4B80-8AF9-A591C4D38813@aspeedtech.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d1b66816-b74b-a846-06e3-4f3720bcccec@roeck-us.net>
Date: Tue, 29 Jun 2021 06:14:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9CFDB695-1F7C-4B80-8AF9-A591C4D38813@aspeedtech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 6/28/21 10:26 PM, Billy Tsai wrote:
> On 2021/6/28, 9:56 PM, "Guenter Roeck" <groeck7@gmail.com on behalf of linux@roeck-us.net> wrote:
> 
>      On 6/24/21 8:35 PM, Billy Tsai wrote:
>      >   > On 2021/6/24, 8:44 PM, "Guenter Roeck" <groeck7@gmail.com on behalf of linux@roeck-us.net> wrote:
>      >   >
>      >   >      On Thu, Jun 24, 2021 at 11:58:21AM +0800, Billy Tsai wrote:
>      >   >      >> The tach shouldn't use both edges to measure. When the tach input
>      >   >      >> duty cycle isn't 50% the return value will inaccurate.
>      >   >      >>
>      >   >      > A tachometer doesn't have a duty cycle. A pwm has a duty cycle, but that
>      >   >      > is completely independent of the pwm duty cycle used to set the fan speed.
>      >   >      > So this patch does not really make sense with the above explanation.
>      >   >
>      >   > The duty cycle means the waveform that reported from the fan tach pin not pwm signal.
>      >   >
>      >   >      > The impact of this patch is likely that the reported fan speed is reduced
>      >   >      > by 50%. It may well be that the driver currently reports twice the real fan
>      >   >      > speed. I have no idea if that is the case, but if it is it should not be
>      >   >      > conditional. The description above states "when the tach input cycle isn't
>      >   >      > 50%", suggesting that this is conditional on some other configuration.
>      >   >      > I don't know what that might be either.
>      >   >
>      >   > According to the tach mode, our tach controller will sample the time of once conditional meet and translate it to tach value.
>      >   > When the tach signal duty cycle isn't 50%, using both edges mode will get the tach value with error rate.
>      >   > In addition, the current report value of both edges will twice the result which will enlarge the error rate.
>      >   > Actually, the tach signal won't be a complete 50% duty cycle, so both edges mode isn't recommanded for the fan usage.
>      >   > With rising-to-rising mode the skew time of tach signal will also effect the accuracy.
>      >   > Thus, using the falling-to-falling mode is the better way for a fan tach monitor.
>      >   > But for flexibility, I think using dts property to control the tach mode is better the user can change the mode to adapter the monitor device.
>      >   >
> 
>      >   Trying again, using my own words.
> 
>      >   A fan normally provides two short pulses per revolution. Those are short
>      >   puleses, and one does not typically talk about "duty cycle" or "waveform"
>      >   in this context. The driver currently counts both edges of those pulses.
> 
> Our tach controller will count how many tach clocks in those shot pulses.
> In both edge mode the counting period only half of the pulse. Thus, it is more sensitive
> to the signal quality of the shot pulse when using both edges mode.
> 
>      >   Assuming that a fan reports, say, 1,000 pulses per minute, the hardware
>      >   would report a edle count of 2,000. This should translate into 500 RPM.
>      >   I don't know if this is currently the case in the driver; if not, it would
>      >   be a bug. Either case, the suggested change would reduce the pulse count
>      >   reported by the hardware to 1,000. If we assume that the driver currently
>      >   translates this correctly to 500 RPM, the suggested change would result
>      >   in the driver reporting 250 RPM, which would be wrong.
> 
>      >   So there are two possibilities:
>      >   1) The driver currently reports 1,000 RPM in this situation. This would be a bug
>      >       which needs to get fixed.
>      >   2) The driver currently correctly reports 500 RPM. In this case, the suggested
>      >       patch would introduce a bug because the code is not adjusted for the reduced
>      >       pulse count.
> 
>      >   The problem is that the patch does not address either of the situations above.
>      >   In case 1), it should state that the code currently reports twice the real
>      >   fan speed, and that the patch fixes that problem. In case 2), the patch should
>      >   also fix the arithmetic used to calculate RPM from the pulse count.
>      >   Either case, I disagree that this should be handled in devicetree. It has
>      >   nothing to do with hardware description or configuration but is in the
>      >   discretion of the driver author/implementer.
> 
> The driver doesn't have the two situations you describe, it already considers the different
> sampling modes at the arithmetic. The patch is used to make users have the option to select
> the mode not just fix it to the both edges mode.
> 

Thanks for the explanation. Please include that in the patch description, and please avoid
unusual terms such as "duty cycle" or "waveform".

Thanks,
Guenter


