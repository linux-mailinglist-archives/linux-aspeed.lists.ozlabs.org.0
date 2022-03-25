Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F154E72A2
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:00:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ0yv0G4Wz30F2
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:00:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eJjdFzr2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eJjdFzr2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=eJjdFzr2; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=eJjdFzr2; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPzGD1FNYz302S
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 21:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648205006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SyWiTIMiSmG4u6YzwD4u0xt7w+vIGYOcYZHs6UnFBQE=;
 b=eJjdFzr2Rxkt/Fc336re0ukzCLGrympQOXu4WK9exMaPk1HtgnfRqCKELSj+BYeRKY8dNz
 M8VIqcmWM/YFIdkWh0G6Os1lOeuDpBSD6B0yMVgke2kAv10BttW8yLQXQn4uYrzE3nvAOD
 KPBInNZ7PS0MoVcph8iD67pvdIWB6ik=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648205006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SyWiTIMiSmG4u6YzwD4u0xt7w+vIGYOcYZHs6UnFBQE=;
 b=eJjdFzr2Rxkt/Fc336re0ukzCLGrympQOXu4WK9exMaPk1HtgnfRqCKELSj+BYeRKY8dNz
 M8VIqcmWM/YFIdkWh0G6Os1lOeuDpBSD6B0yMVgke2kAv10BttW8yLQXQn4uYrzE3nvAOD
 KPBInNZ7PS0MoVcph8iD67pvdIWB6ik=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-s5NJUDQRMNOjV3riHrz8KQ-1; Fri, 25 Mar 2022 06:43:24 -0400
X-MC-Unique: s5NJUDQRMNOjV3riHrz8KQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so3925843eje.6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 03:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SyWiTIMiSmG4u6YzwD4u0xt7w+vIGYOcYZHs6UnFBQE=;
 b=uBHmWvTZv0+OXpuIDJF5Ocfnhsbn7c2QRQVyIhhwp8zumd9HUCaAuVndC8HIVcrwQm
 MD+vp60Z6YJJKY/GdL6KF0WGvo11787Bis+lmFy0wa+hfBCRC5rKbtlEm44+aa04ZJq1
 p/3lRFR4W1OHbgzWZVue/RG7MUepXeDqeidW9qwFuqmKeVaLH9RxqF1T0/VmT5uTNh2G
 aEkiq9isrltl3SCCje6sxZc35r8jqGtd3f10Xn55CxcCvQz8MTjYu8v2vnJM/YmEWk1a
 z/DRksMoXlCR/Ovzie6wAl6d2bPkWZt00Oodt045NJDTygBevL/FGiEQbW5eNT/1z6qa
 BEnw==
X-Gm-Message-State: AOAM533BWD2LWDJ4aM3q+FbqsuwHW68JFWj5c3MXD8y6KEBxLgY4qGWP
 BGguFxtVLRBbEQCtquS+IAIjjIGyGwlZ+n3UysKbrnmLAeQyzYfUOOxi5w/mnDfkrx5iWZHgsAM
 enhB5Wi8gqnqgi1Pp2zGl36lDIQ==
X-Received: by 2002:a17:907:7f0b:b0:6e0:a336:a3f5 with SMTP id
 qf11-20020a1709077f0b00b006e0a336a3f5mr2269071ejc.541.1648205003498; 
 Fri, 25 Mar 2022 03:43:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn7dUpU6RhGkH+cmx02L2Lt5GssfkfC3amGgQ/83AFggV0T8LFHEtxdXiKDxurycDIh0lMlg==
X-Received: by 2002:a17:907:7f0b:b0:6e0:a336:a3f5 with SMTP id
 qf11-20020a1709077f0b00b006e0a336a3f5mr2269046ejc.541.1648205003312; 
 Fri, 25 Mar 2022 03:43:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0?
 (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
 by smtp.gmail.com with ESMTPSA id
 d23-20020aa7d5d7000000b00418f7b2f1dbsm2658310eds.71.2022.03.25.03.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 03:43:22 -0700 (PDT)
Message-ID: <5c372eb8-d1f6-a001-fad2-fe11e0b37575@redhat.com>
Date: Fri, 25 Mar 2022 11:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] Documentation/ABI: sysfs-driver-aspeed-uart-routing:
 Fix sphinx warning
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Huang Jianan <huangjianan@oppo.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>
References: <20220324165918.22005-1-hdegoede@redhat.com>
 <20220324165918.22005-2-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220324165918.22005-2-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Mar 2022 23:00:04 +1100
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-aspeed@lists.ozlabs.org,
 linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-kernel@vger.kernel.org, Gao Xiang <hsiangkao@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On 3/24/22 17:59, Hans de Goede wrote:
> Fix the following warning from "make htmldocs":
> 
> Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing:2:
>   WARNING: Inline emphasis start-string without end-string.
> 
> This is caused by the used of '*' in the example cat command,
> mark the command as code to fix this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I see that this was already fixed by escaping the '*' with a '\',
apologies.

So this patch can be ignored / dropped.

Regards,

Hans



> ---
>  Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> index b363827da437..1e25cd2cacc1 100644
> --- a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> +++ b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> @@ -8,9 +8,10 @@ Description:	Selects the RX source of the UARTx device.
>  		selected option marked by brackets "[]". The list of available options
>  		depends on the selected file.
>  
> -		e.g.
> -		cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> -		[io1] io2 io3 io4 uart2 uart3 uart4 io6
> +		e.g.::
> +
> +			# cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> +			[io1] io2 io3 io4 uart2 uart3 uart4 io6
>  
>  		In this case, UART1 gets its input from IO1 (physical serial port 1).
>  

