Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3242189E22C
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 20:08:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vywcksvn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDYqG5KK2z3dW3
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Apr 2024 04:08:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vywcksvn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDYq53vtwz3dVX
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 04:08:16 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e0edd0340fso54199965ad.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Apr 2024 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712686093; x=1713290893; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POlFcO8rRiMn4XpW5ioQKkg2ZlLEK2LdmVjbB41yM08=;
        b=VywcksvnKM5/PUU9Ze1dU0qh3zpoMy2UYx2TMa4DqT2ijFg6eqjRRujSxDH7xpCINa
         2PKBP7LwPkKCTC+4xgUAMP7lAI4aV49XGXfy7jbG9AXMhBxwB2KsA2rWyJdqNh3avBeo
         PXzVeq2kX+xYqOnp79BbPAT4SdjPx6Rf4PG9o3prj6pp/NR+N/vj2DJyasZn+O8Lh0C5
         iXMrGCQ996ZWpBRawL93uppY1mFpVrY9ZYwGCgPHp3hWdqQazZL5sbGnUWlLLw3cz6Nn
         AKkRvT/4kl4QSI/N3gDWfQSk32ahOaEc0SLhCFNvb0bU7BJ7S/y0Q5MiXKwcY4gOMuw7
         tCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686093; x=1713290893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POlFcO8rRiMn4XpW5ioQKkg2ZlLEK2LdmVjbB41yM08=;
        b=HZCjk1X5xS8r1mdl3vWRTJupHki26xRE2ggiw5LYV2FlqQVevI1Fw0cgFMbtcDozUK
         cqTyr0u8chiG6uXREJFDuZeY9SeOjhS31pzlpV4UhXwYrFcs1bjlLKImXemOJ8QJ7UWJ
         LYEydFSz1oOgKGyCdNGllH9hxl2fDELMzaWRkqEh2J1Bfeqdr001JBLgR16yopbdRcX8
         UJTZyd0KWJCoHbRZ8UyzpZkVjWD2UXZ+c/xp08GH8IuGjyEsoAkZ1ZyjSQyFvr0SpGn8
         514MtNFBZErW3ypg/7XXbROKTNAXfODd6BPqSZ8uOfvIUhj4AhTdCszP7DF3ov0ULOXT
         Micg==
X-Forwarded-Encrypted: i=1; AJvYcCX1/HXwsz6okmFV4jcYZD0VspNS0QYbKIZ+7aYkA2kaTjrrjWpXp37j+D7v8R2Tn2v5XjidTkAU2KjDGn5X6zaCElCUth63+FYc9El1VQ==
X-Gm-Message-State: AOJu0YwFtjLv0PyRTM/a5Kd4siKdpIw/1BWwwWnbLVHH45F0is27Dtln
	K2bWeGVyaBmYZVO2+Yt2McJ+d1W14D1q7R2E7KtaZejGHIKODbqO
X-Google-Smtp-Source: AGHT+IFzjFhyBMx6hv8MZ4xwZSSjTQZI1dh3fOoNpvvtY6yc9ogy1c4zmy1+R4Fpx4j8O6s7YrZffg==
X-Received: by 2002:a17:902:ea01:b0:1e3:e243:1995 with SMTP id s1-20020a170902ea0100b001e3e2431995mr677747plg.1.1712686093000;
        Tue, 09 Apr 2024 11:08:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b001dda32430b3sm657972pla.89.2024.04.09.11.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 11:08:11 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:08:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: PeterYin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v6 4/4] drivers: watchdog: ast2500 and ast2600 support
 bootstatus
Message-ID: <01a07242-22ca-4abe-80f9-72ac4de93fb7@roeck-us.net>
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
 <20240328022231.3649741-5-peteryin.openbmc@gmail.com>
 <47835475-36de-4682-84ae-0163d45d0bac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47835475-36de-4682-84ae-0163d45d0bac@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Apr 10, 2024 at 12:28:44AM +0800, PeterYin wrote:
[ ... ]
> 
> Hi Guenter,
>    Could you help me understand the definition of WDIOF_CARDRESET in the
> kernel? If it resets the CPU, should all values be reset to default? Should

Documentation/watchdog/watchdog-api.rst says:

	"Card previously reset the CPU"

This is a bit historic and was probably defined when watchdogs were
not typically integrated. The appropriate description, applied to
current watchdog devices, would be something like "The most recent
reset was triggered by this watchdog".

Not sure I understand "If it resets the CPU...". It doesn't _do_
anything, it just reports if the most recent reset was triggered
by the watchdog.

> we check the POR (RstPwr Power on reset SRST# flag) flag in SCU 0x74
> register bit 0 in ast2600?
> 

Only if it indicates that the most recent reset was triggered by the
watchdog.

Guenter
