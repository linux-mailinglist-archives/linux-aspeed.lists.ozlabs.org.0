Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB14A96EC0B
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 09:34:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Sfm41Vsz3064
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 17:34:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725608078;
	cv=none; b=lQNgpVwBlwuUdSf8StjITlrPFJdQ2doVZBE1Db1sVrqifHQp65d//cvtfjYJopbabWAXcfqYU4yKm+DtgJhZY6Ui1lRIpDx35PljLGfTPTGkE5QB/WojB2qeqaIrM+e3jpXGPBePQ20/9DMf1A/XN5nJhRJKX4QiJGZZC9DKY8gJZelT/SWV4ZaUUor5yj/0Bdkheieh2JEu/4aq3NbviUnSgJHcFAjMqRVS33o0jrCLBW8VYL6dNGr/c7K+H+d/24hasIFruwCehDvnybYUtzIhd5qU8RPBTYVHu5l8k+A35LUCNPI2gsgrfMspyUZ5R4/4E672WQD5v4uTtJDu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725608078; c=relaxed/relaxed;
	bh=OzWwlgD21vw3dYHmaJkpCeyi7AwIVfGBZ5Yt8JsuZL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhXFN0wtnXPS6pGvIbA6MLwBRYItXU32FOCKPNNeWO7ZMBEa0k0hM0SZp5stHi1RrAWMPjUiY2W2XHwmaujubnn7GxhS8MaND98PRS6I/sI3UYbiGL5C5QAJHIDA5lFxMsIxEXZaERcjAETd2zGp4ivu2z7Pv4lm7DHLvcMy4JuvHhYQZpt6naRvnP8zX1TEDY25WnDBWvHXlYn+B9ZCiFCZbF7KaOO87cbVZVuxULubNN5uI//o46CMEqVqvwxmO/I09d8p5WMUgSVhNbn2/u1lrQrGFSXjLA5Z/Q0wMsUMU2ulNftg4jSotfIDU8NKphBDiYHTnIMiykZOdYKi1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.128.180; helo=mail-yw1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.180; helo=mail-yw1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0Sfj1xRzz2xZT
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 17:34:35 +1000 (AEST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6d9f0cf5ae3so20460717b3.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2024 00:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608072; x=1726212872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzWwlgD21vw3dYHmaJkpCeyi7AwIVfGBZ5Yt8JsuZL0=;
        b=Oa8nN2tOaeFKCzyq2U4jfrbXG4d9Ir/u2NqA72OM48OIZ7WXvtYF0koiDlxMNfVtfi
         IbDnxfFSKKPIIgQYlr81fidoWHJh7poluQVixxdyv4wdsNwsX3hRdBgT0oGv92BMnrW7
         zwlAgx0iR3i4JWhxVcZpoR77lQ4ARlycrBC8iWcOlXJ0sNvsZFXNyNt7XK2QEjBp2R/4
         hm97i4hzzXO4jGlfzvKfW1LRyGiRhc5jFE8xJmXlSJek0YjA2mpu98MxH3O3jp1WN8WM
         YOUcpwG+IuiaYloE1kY7TDU1lKJuR1naseaAl/vXHo3cvBHR3gK7E1uV1WefXa6+7LSc
         fg6w==
X-Forwarded-Encrypted: i=1; AJvYcCXbjS8TXcK/YosFDX9SSSpiQ9oi3nx5OSyV0CNVkv6+dq7zJfN+F488AfZTpVMA/76d0B4btbA7hc0iRoY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXAKVXI6C/oOWpQjrscWtLkCpk+M+52VYfzF6t23QtawafHMw/
	piaQGjn302eUJgoOdo1G+qQEaT+LPah3Yw+KAhMGbyiybOS8V7y/SdXaTE/H
X-Google-Smtp-Source: AGHT+IFaOLOz3uDivM6XjcIO5vmxXeZ5i3xwrEuh7oKrOWLC0iKiheDNa/1roJm0o88sYIjx1DYxeg==
X-Received: by 2002:a05:690c:4182:b0:6d1:1612:5084 with SMTP id 00721157ae682-6db45273fcdmr14484277b3.43.1725608072389;
        Fri, 06 Sep 2024 00:34:32 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d39c78besm31916977b3.16.2024.09.06.00.34.31
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:34:31 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6d9f0cf5ae3so20460577b3.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2024 00:34:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIoo7UPDB4gR29zvwIDZnPh+93llSrm6vMGe4wHTCXp4RK9MdQhnLkppiHrYRq/JEg5iXBY2nulriSsiQ=@lists.ozlabs.org
X-Received: by 2002:a05:690c:61c6:b0:6db:3b2f:a1eb with SMTP id
 00721157ae682-6db45134ccamr24089527b3.26.1725608071358; Fri, 06 Sep 2024
 00:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com> <20240906062701.37088-9-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-9-Delphine_CC_Chiu@wiwynn.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:34:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTkLDz=5+GH+kKhfKC89nh0+bKh=X4A7bdeiMoBgPwWg@mail.gmail.com>
Message-ID: <CAMuHMdVTkLDz=5+GH+kKhfKC89nh0+bKh=X4A7bdeiMoBgPwWg@mail.gmail.com>
Subject: Re: [PATCH v15 08/32] ARM: dts: aspeed: yosemite4: Remove space for
 adm1272 compatible
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 6, 2024 at 8:27=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
> Remove space for adm1272 compatible
>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Fixes: 2b8d94f4b4a4765d ("ARM: dts: aspeed: yosemite4: add Facebook
Yosemite 4 BMC")

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
