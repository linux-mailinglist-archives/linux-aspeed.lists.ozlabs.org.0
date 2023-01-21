Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 011756762A2
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 Jan 2023 02:11:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NzJGc0vlQz3fK0
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 Jan 2023 12:11:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p90/iVTk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=vijaykhemkalinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p90/iVTk;
	dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NzJGQ7319z3bTK
	for <linux-aspeed@lists.ozlabs.org>; Sat, 21 Jan 2023 12:11:09 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso5470985wmn.5
        for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Jan 2023 17:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oq7QCgizEzioN4Ttj4E06X4JJrWE4NM3pYvmy+WoN/o=;
        b=p90/iVTkeZT0mM6R5Ys3X6OZDpIIDRmboK0KXzcSgk0mnkqXPsppL7pvUBuo3v3b+x
         4JKeOHKl1/kWs2U40zoYhIpkhry4vKEm5Z4QYRFvVMWRz6rQahuhSjLQKLCWOY3s9iih
         U0BwK3GvMc5vJZcS5v7s25BfyjtcLiQiaBbMvYrXtqVzEDuwnewv7O1Xug1HSSP/TwDV
         /C/waSFfhEe0IkBAaKZtUqdQS68ADazbViwetHnpxgbeQ+3L2A5muLDVeb6SSEF4+pgr
         g0+wiW809qiZ4sgWD2O7W4XkkXTZBBlE/6i+lOyzbmk3Y4mSU9N5RF4d1NXEcZtwqBC1
         ytsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oq7QCgizEzioN4Ttj4E06X4JJrWE4NM3pYvmy+WoN/o=;
        b=kbPve/dZTWUVJcZ0Dj3li+NnI5E+93+REJCyQBWJchPXNwM9MrQ00eAX3gJNdtE/DM
         nxOY3o7iwzbHNIYlOXLdJm0Ts7ltWeBsaoV6fLjaBCDlQoYhQ0KlLYzMlg7bih9irPvc
         urUPwJ+jYGXIkga3DpcIxL0ip/kYzIcfRj2qVYjQ7N+KA32Mo2dY8oHZmSEEILpK5OB+
         hwO7rHKU3INjPcZEluDcxYydfxerF2H/zuBaofwbSwI135qQjtxPJ9M3o589ZpHN5OiM
         RqDkP0ndGwXXwW+ILb+sltTdK44Azh5hbHlQ1WjTVLM7nDx1XLIfW+QUzwVbb7feXuMf
         o4Zg==
X-Gm-Message-State: AFqh2kpwK1JjrlJ/r5OrCcBDELeV6McDPEhTEtquxf7zNgESN9mS1B0v
	7Hz9/BR4S/I5JlaIkjf0j23XGS7DFUzEOlug80RC1PTY
X-Google-Smtp-Source: AMrXdXsv3KJtEXMCkM+vbFDf7b0Uah/Wnw38KH8D6aOPzp+sSgZlywBrDUjlUd74eV1IYrtoqpgYbOgTwd7SMXSNnAg=
X-Received: by 2002:a05:600c:3650:b0:3da:feb7:12ba with SMTP id
 y16-20020a05600c365000b003dafeb712bamr1035657wmq.112.1674263463452; Fri, 20
 Jan 2023 17:11:03 -0800 (PST)
MIME-Version: 1.0
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Fri, 20 Jan 2023 17:10:51 -0800
Message-ID: <CAJTGxZH2VAn8-=LKuA76bGkrXtm1y99LW_-yDqh52UX7Kd4tZw@mail.gmail.com>
Subject: KCS over eSPI
To: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, andrew@aj.id.au
Content-Type: multipart/alternative; boundary="000000000000ffe23205f2bbd67f"
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000ffe23205f2bbd67f
Content-Type: text/plain; charset="UTF-8"

Team,
I am planning to use eSPI interface instead of LPC on aspeed. I see some
patches by intel for espi slave driver but I need to integrate this with
KCS. Our current upstream version of KCS only supports LPC. Please point me
to any patches available to support KCS over eSPI.

Regards
-Vijay

--000000000000ffe23205f2bbd67f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Team,<div>I am planning to use eSPI interface instead of L=
PC on aspeed. I see some patches by intel for espi slave driver but I need =
to integrate this with KCS. Our current upstream version of KCS only suppor=
ts LPC. Please point me to any patches available to support KCS over eSPI.<=
/div><div><br></div><div>Regards</div><div>-Vijay</div></div>

--000000000000ffe23205f2bbd67f--
