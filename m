Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C85B7754A3C
	for <lists+linux-aspeed@lfdr.de>; Sat, 15 Jul 2023 18:56:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fzrnUjCr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3Dxm6BQKz30h2
	for <lists+linux-aspeed@lfdr.de>; Sun, 16 Jul 2023 02:55:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fzrnUjCr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3DxX0BJfz307V
	for <linux-aspeed@lists.ozlabs.org>; Sun, 16 Jul 2023 02:55:42 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-66869feb7d1so2142527b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Sat, 15 Jul 2023 09:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689440140; x=1692032140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubGyv1/Ygc3r0aejvSCA4OLowIeO/QtJDtMmWSuLbbA=;
        b=fzrnUjCr7PbCvdmX9z+HiWchCOfsiRzoqKnSIEyCXGwDe/iSWnthmjiOtjoalVTaiu
         bwDrRhoAvkYJ88WYaQ4rfd11vj7znKX4TLilqXyxFWTOWcM8tSSaqJecr+CAdIlrmNy5
         iuRrAAxeF8d70ZxNirl/zOrR7EnUA9Ye4e90QdRxIxrCOLyhtmtyeKIuQXKxi7MiUXzv
         qvNbVuQahDlB2S4OTtPx/bFhv+7uo3DKEW0NqSGFtkYhV/NQxUCsxiSiwNIsKZd6Q8wk
         +lXOVoU5cCVHR5uan3DOc8ngVbwt5GheOlu0mJkEl+bqoVZC4oSDsFOmK5nO/JzqYFCC
         q3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689440140; x=1692032140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubGyv1/Ygc3r0aejvSCA4OLowIeO/QtJDtMmWSuLbbA=;
        b=c811YJ0VDB5JEQVVrOajkzbMjRqkI9xD4F5BkKLCp6Y++IJRqRLsCxkBtJEi45ATMt
         SK96DkDLgSQD0ygP2RhFuyTN+NAUMOyFoTtX+71CR6nveL/VkES4KBTZq1N4V2v5uDMR
         8bIZMnlTuQqUMeunr89Tz8cNiYvSw+JN1SS6wYEu/ygCz3lkLXyxKKccKxZ9O1wa0P49
         zDDcCYdj3NZg3XnOdajvCjXWRzz7Cch0Fg65Dv8kk3gSvgyB5SI8xftGXTu8wypvsPe8
         smn45SdyMTlPAqPWvO0X/FaTcprwWMWlfYWnm4jVFUbGFI0ihcS5+hEgBwedVhhd4jW7
         ZhKg==
X-Gm-Message-State: ABy/qLYwuoVBVrdmjAnrlsJCs+G8qWErumXWbseUbY8orz2JxifstwMd
	jCPRDe9k+4/P/K9eS/VJaZk=
X-Google-Smtp-Source: APBJJlGDhaXWS+ae0J4ItsPOsBi6CjK6+MtngxLk1oc11DllicWU7qKMFYrUsJaRbQsY0y/1bBTzSA==
X-Received: by 2002:a17:903:455:b0:1b8:a4a9:6225 with SMTP id iw21-20020a170903045500b001b8a4a96225mr6961436plb.7.1689440140062;
        Sat, 15 Jul 2023 09:55:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f28-20020a63755c000000b005501b24b1c9sm9419828pgn.62.2023.07.15.09.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 09:55:39 -0700 (PDT)
Date: Sat, 15 Jul 2023 09:55:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] hwmon: Explicitly include correct DT includes
Message-ID: <e0e1b465-8419-419e-90ae-4b72f5189469@roeck-us.net>
References: <20230714174607.4057185-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714174607.4057185-1-robh@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Saravanan Sekar <sravanhome@gmail.com>, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Jean-Marie Verdun <verdun@hpe.com>, Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>, Nick Hawkins <nick.hawkins@hpe.com>, Sudeep Holla <sudeep.holla@arm.com>, Luka Perkov <luka.perkov@sartura.hr>, Robert Marko <robert.marko@sartura.hr>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 14, 2023 at 11:46:04AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter
