Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DBE4EAB06
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 12:06:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSQG24hd9z2xy3
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 21:06:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g1SGsbd/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=matthias.bgg@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=g1SGsbd/; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSQFy4lPNz2xF5;
 Tue, 29 Mar 2022 21:06:45 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id r7so9945036wmq.2;
 Tue, 29 Mar 2022 03:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gJYdJOur1iY6XbbeGXFj0ECGEHoJkzCeSnRWw+1akAE=;
 b=g1SGsbd/jLtCfDq6yzASjQLg1D1Di4TRzjMb5UiIfrE9WiDmnp4ps8sIblZUNtYLhl
 BEYp/E3cwcQ3Zx0+p3QoptHL3A/ppqsLefEG80tXSSwr+mpdP4i1AcDwb/671KD/V7Or
 SrBc47ULMLUb19cniOzsSHJIDLc2hutPluz+X07qok/90+UjDzhv6DSHFkWqgCReRafg
 8hQGGxrcX5P2AlRlhAUeG7o275fLN5UY/luSiQ/PippZc5scePfD88DWfB5YY4mbajP2
 /wEv07hBPdodolgvcwPf/ryO4mcjf2pm6CqHleQKRp4LwbU9hZS+Lg1pg+jJITwfzWUK
 5rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gJYdJOur1iY6XbbeGXFj0ECGEHoJkzCeSnRWw+1akAE=;
 b=c9Toa6NPKchpZ3CTOr2Cumu+HD2gmia/f6YbDYfEHkbC5/OS2udXIz5tSLEWQ1RE7A
 tdm9+E1HObQJ509+e2een9ebHfqJlKNSXBa2Q/L/Svbt20kmi3/GGQihXzZUx1ET1NOl
 QGpkP7uSgOHlGI1n8pG+BS5vThEZ2BELMQ7zSihdAcwDADAicBj4VyeWzGjmfY6qcz2n
 IKXRwugOC9khl1NX29aCKcssbNKNhb0cQSfmj2Kq9LriGcklMifNmwrt/3ArJc2XCBOh
 b/8dp/4VCRT4LIMGpLBBlRSyGajsG2H81/yD19Q99y1Ct9D94LE8wxmZ3Bo3hReEWO74
 3RvQ==
X-Gm-Message-State: AOAM53215YO0224bjBETtIHMn0uBT5wYb84OXqF145SROGz+mmgI3UkS
 yObvHSqwx9pq31sBxpZaxI8=
X-Google-Smtp-Source: ABdhPJw/yl37bo84CH0/pwnTrqSkLHICdBHbZfyNAKleJ5pkLbBWcMtajlzC2TVgbnU7tHyn6wt30Q==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id
 c7-20020a05600c0a4700b0037c09652b6fmr5636166wmq.31.1648548400811; 
 Tue, 29 Mar 2022 03:06:40 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a5d456b000000b0020406ce0e06sm14201716wrc.94.2022.03.29.03.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:06:39 -0700 (PDT)
Message-ID: <6dafde7d-17c6-bd25-dbe8-7f7acf80fd91@gmail.com>
Date: Tue, 29 Mar 2022 12:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
 <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
 <YkLXTWdZ3zASxr4H@atomide.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YkLXTWdZ3zASxr4H@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Daniel Palmer <daniel@0x0f.com>,
 linux-arm-kernel@axis.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 29/03/2022 11:54, Tony Lindgren wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [220329 09:02]:
>> On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
>>> For example, I have a pile of pending omap clock clean-up dts patches
>>> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
>>> redoing or fixing up the patches with sed :)
>>
>> Git merge/rebase/cherry-pick should handle renames fine?
> 
> Possibly.. Not sure I'd count on that based on my earlier experiences
> though :)
> 

Yes. If this could be split up in per silicon-vendor patches, the maintainer 
could take them. Although it might be a pain to soc maintainers to resolve small 
conflicts when merging that branches.

Just my 5 cents.

Matthias
