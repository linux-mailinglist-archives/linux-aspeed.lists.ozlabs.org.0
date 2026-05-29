Return-Path: <linux-aspeed+bounces-4150-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIGfI0dAGmrQ2QgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4150-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 30 May 2026 03:41:27 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AAF60AD32
	for <lists+linux-aspeed@lfdr.de>; Sat, 30 May 2026 03:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gS2xl58HSz2ykX;
	Sat, 30 May 2026 11:41:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780068481;
	cv=none; b=fc7fyQw7FnM4eQpUUaNM0xQXD3eVmdSGo9LljTEQWrnCVzYJH/MQYxiqq62cn0U2Eayi65HRcdT2/h0Xi74odZO+wwq/ovioR5cSNHWoCCd2+sAmEZabMS0hz3Wqeav67WXnpcxvumtDZf9DGzZWw8dsssMqjA5R+b155MNozK7c1y8acHUW9DS3rioNyjeee3s+5xdEeeaj0QR3FzAWX5owvpZYVaxTeXU6Iz1+odx3gJvX3u6Npjwz5UkwFQwNoXGLG/Sjy4FXtESUR1e1KJ6d17VbDSVe+O1z/Y2yJjQh4qezdnRJ7YtWqv2rayrC6cUD8ODRT5iW1ogKYAYHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780068481; c=relaxed/relaxed;
	bh=U9UfxUzmEbNMuo7l98ruKjqPcorhs4Pq//vubPQpRUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BU3p1A9qs9cIK3H7Mw+3wQEFoSL5uZvFzYDnLAufgUB8fD5k4SrHjRL1Vkem2Nv/IcH+RiXqMnLyGfrRcMc4RDggZ1T7ky91h2ZuwxjE4e7QKbt89YMyvD6hRSH8wApD+Bk9ctpZVAC5JbcNlU4hRGLE+dObLQgqfaSxT8ZqezRlz+B2j1j4CYjaJu9uZ3HJbCjyAjV+pqe9C5UlcGpIUM/3glHj99BknzQeB6LStPmEOZ4+kn/4+qCJUdjjZvhkbF6QG+EdELPcBouL4WGL6YGB79FG9Y+aN7PN3IJ3ItxV2fOJ1KSbNiS+OQTlZB/m7K8knpZBJGy6a/TgYffU/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=E/Y8OmFz; dkim-atps=neutral; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=lukasz.luba@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=E/Y8OmFz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=lukasz.luba@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 581 seconds by postgrey-1.37 at boromir; Sat, 30 May 2026 01:27:59 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gRnL76CvWz2xRs;
	Sat, 30 May 2026 01:27:59 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D29DD1C00;
	Fri, 29 May 2026 08:17:41 -0700 (PDT)
Received: from [10.57.26.238] (unknown [10.57.26.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8093B3F632;
	Fri, 29 May 2026 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780067866; bh=i14utAyWVag4qxanxiMOSsLoacp5PlK9awjdPrY0Lt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E/Y8OmFzjPPiFlVn4wlpigbZpVnBOLe/nvmQB9aWj85QNMT7/qwPvsbPCBXgoTSUY
	 ILoZRm/Zx+YVmLnnnjl6SbY9FgvOkUu3spSzSN72QzgqEzBR85lxu8q43Fz/aKK1vx
	 t17fO/GqqvBY0+f/5OA/Bl8CQBWaofzEEz9yntmI=
Message-ID: <c99085e5-cf1f-479d-bef0-b6a4161482e5@arm.com>
Date: Fri, 29 May 2026 16:17:33 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] thermal/of: Rename the
 devm_thermal_of_cooling_device_register() function
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org,
 daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 "open list:KHADAS MCU MFD DRIVER" <linux-amlogic@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
 <20260526140802.1059293-18-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260526140802.1059293-18-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-4150-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[54];
	FROM_NEQ_ENVFROM(0.00)[lukasz.luba@arm.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,etnaviv,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: A6AAF60AD32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 15:08, Daniel Lezcano wrote:
> To clarify that the function operates on child nodes, rename:
> 
>            devm_thermal_of_cooling_device_register()
> 	                     |
> 			     v
>         devm_thermal_of_child_cooling_device_register()
> 
> Used the command:
> 
>       	 find . -type f -name '*.[ch]' -exec \
> 	 sed -i 's/devm_thermal_of_cooling_device_register/\
> 	 devm_thermal_of_child_cooling_device_register/g' {} \;
> 
> Did not used clang-format-diff because it does not indent correctly
> and checkpatch complained. Manually reindented to make checkpatch
> happy
> 
> This prepares for upcoming support of cooling devices identified by
> an ID rather than device tree child nodes.
> 
> No functional change.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>   drivers/hwmon/amc6821.c                  |  2 +-
>   drivers/hwmon/aspeed-pwm-tacho.c         |  5 +++--
>   drivers/hwmon/emc2305.c                  |  6 +++---
>   drivers/hwmon/gpio-fan.c                 |  6 ++++--
>   drivers/hwmon/max6650.c                  |  6 +++---
>   drivers/hwmon/npcm750-pwm-fan.c          |  6 ++++--
>   drivers/hwmon/pwm-fan.c                  |  5 +++--
>   drivers/hwmon/qnap-mcu-hwmon.c           |  6 +++---
>   drivers/hwmon/tc654.c                    |  5 +++--
>   drivers/memory/tegra/tegra210-emc-core.c |  4 ++--
>   drivers/soc/qcom/qcom_aoss.c             |  2 +-
>   drivers/thermal/khadas_mcu_fan.c         |  7 ++++---
>   drivers/thermal/tegra/soctherm.c         |  6 +++---
>   drivers/thermal/thermal_of.c             | 15 +++++++++------
>   include/linux/thermal.h                  | 16 ++++++++--------
>   15 files changed, 54 insertions(+), 43 deletions(-)
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>


