Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBE61E4BC
	for <lists+linux-aspeed@lfdr.de>; Sun,  6 Nov 2022 18:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N51H31b0Qz2yR9
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Nov 2022 04:16:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=noua/yFq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=noua/yFq;
	dkim-atps=neutral
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N51Gv4dV2z3bbb
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Nov 2022 04:16:06 +1100 (AEDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-13b103a3e5dso10490243fac.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Nov 2022 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEv5IfnJcbTamlVtUpqiTgyx6Ij9nPLIySLxf/hjkbo=;
        b=noua/yFqm3voDQ4vK/Xnwv2lPUhv/bjeNBEioUMO1caiY+cqjqktx+Pq+DRvesZCgA
         d//QuwBhkaum3ZBYqfka1bjS4ugjvhz9zNrSBccZhQnCtF5iSpOiT1aqW4lzlyJCKvrV
         dQx6PgpGJKBWIl75kdxQhvPvNmohvGiU9mjOOPYyrhjV6FiChPpKXEJGdG1Z//cOb2uy
         YmEf79V1DwuecsFIiSRsvbyzi1fqNHa8BDzUHl5y5Pv1lOKXCOWge8VhqhweK8+mq7T6
         oc9rMh9QUnrWGArDAbXUF3fHSqvgREeIP7GukLeCHvRT4nVTCvhAgf+vo2IbBXnnMtFo
         +RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEv5IfnJcbTamlVtUpqiTgyx6Ij9nPLIySLxf/hjkbo=;
        b=Xcp++B8JT2cBcK6XGGChUfhoD3sBH6Gfqvr/VoAhloUV91woxeM+aQc1Gx/k7s/53F
         esIiF2W4bMqCkpKMWDFKSFev3Gj6Hh6YdOZB0rJ4oLKXVkSycHodszA4l6HjqZA0Z8PR
         WZQjORp+dF6A72cZA+mRfsZyaNW9xMYGdlTAkFUiK/jtG64sxojhG+26gKM0hWb6ESi9
         tCpM+zhcVpOvPitVb49Gs1p3nr0MFocXypOKxMTrdO8j2kO6zQFUFJLt9c2vjZwR4BJm
         9f3sSOeueQXYynujsOXl77W1DFy2gOPk1ZuEcqwb6BSWEOsUMBpYXr0e/r8kbE9yQOFc
         Kpdg==
X-Gm-Message-State: ACrzQf3gSymxj5zTBxxTWfiDaedlE5rBq4etW5tyMYzMcC13D+VGymLI
	NUoKB/U48RvU4zWURrmMu2k=
X-Google-Smtp-Source: AMsMyM5bzIlrUuIFBGzNbqYQ02V6lN7ciCTOZDwHAvBLO5/YGgrsTnGI/pK4hMCO3nar5mewI1/zCg==
X-Received: by 2002:a05:6870:4612:b0:13b:775d:511 with SMTP id z18-20020a056870461200b0013b775d0511mr37349401oao.81.1667754963323;
        Sun, 06 Nov 2022 09:16:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w52-20020a9d3637000000b00668953207b2sm2022492otb.80.2022.11.06.09.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 09:16:02 -0800 (PST)
Date: Sun, 6 Nov 2022 09:16:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] hwmon: Include <linux/kstrtox.h> when appropriate
Message-ID: <20221106171601.GB105056@roeck-us.net>
References: <0e819645f8d607f7b4550c8aaf4a563b1404bf40.1667730675.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e819645f8d607f7b4550c8aaf4a563b1404bf40.1667730675.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Marc Hulsman <m.hulsman@tudelft.nl>, Rudolf Marek <r.marek@assembler.cz>, Corentin Labbe <clabbe.montjoie@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>, Juerg Haefliger <juergh@proton.me>, Steve Glendinning <steve.glendinning@shawell.net>, Jean Delvare <jdelvare@suse.com>, Roger Lucas <vt8231@hiddenengine.co.uk>, Tim Harvey <tharvey@gateworks.com>, Riku Voipio <riku.voipio@iki.fi>, Hans de Goede <hdegoede@redhat.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, Guillaume Ligneul <guillaume.ligneul@gmail.com>, George Joseph <george.joseph@fairview5.com>, linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Huang Rui <ray.huang@amd.com>, Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Nov 06, 2022 at 11:31:27AM +0100, Christophe JAILLET wrote:
> The kstrto<something>() functions have been moved from kernel.h to
> kstrtox.h.
> 
> So, include the latter directly in the appropriate files.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The goal of this patch is to eventually remove <linux/kernel.h> from
> <linux/watchdog.h>.
> 
> This patch is needed to avoid indirect inclusion, via <linux/watchdog.h>,
> in fschmd.c, ftsteutates.c and w83793.c.
> 
> 
> Maybe, just including <linux/kstrtox.h> in <linux/hwmon.h> would also do
> the job. It is likely that this file is included in all hwmon's drivers.
> Let me know if this less intrusive approach is preferred.

Include it from <linux/hwmon-sysfs.h>. This should cover almost all
drivers needing it. The remaining drivers (if there are any) should
include it directly. Almost all drivers registering the hwmon device
with [devm_]hwmon_device_register_with_info() do not need the include,
but (almost) all drivers registering with an older API will need it.
Those drivers will also include <linux/hwmon-sysfs.h>.

Thanks,
Guenter
