Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB849579C7
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKV0X7Rz3c2P
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I38J8K7b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=parisnikf@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9m46kVz3cML
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:48 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57d251b5fccso6443841a12.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 02:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719392986; x=1719997786; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iSNTVmAN8vqxwxuPIN5aGKy71ovsMKsUZKjFqxEWfJA=;
        b=I38J8K7b2tRVcdjeBD2uKRSIMAxtKMR8Rfb9RBVr6pS3S7GTIYEsg22v6ev0yD8bYf
         KyQ6p8quVXIzoUJj5BVJjyOug2e1+1UHe9HfG3bAKV4DZo2WOMG1cwFNhRLWeGCMYj9i
         PZsAPUBnss78bgf9zu+HuDlHwvKFLQMMhiwZy4pdF4ZD1NdnS4386kepXwnC9+1GHhp1
         +xK+l9WOixBPC615fQD1t6/1LXahr5p0KlO0d/gKQGZjN7SsavDKm3pXG5dBT3hx6S+V
         KMaFteaKAJzmYd9DkvSPlE1aUT8Tm32xy/eM/G5uSGWkTP2bt86fENBpmeeW5zKxkBPx
         grdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719392986; x=1719997786;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSNTVmAN8vqxwxuPIN5aGKy71ovsMKsUZKjFqxEWfJA=;
        b=v05tKjETErosslNrxht/1Npwb1OvfgGJ9XG1u1RyRp+okX+70q55iTIamQEHezj2dZ
         kEOkAVc/M/XbfhurB7+5+y1IfkR9mpy1NoQStc6rlqTTConmOB6bDG2G5Amwj0f+H28m
         UJaaCCeD8FJi6Ianl3vG8DPMo4zVYMdOuzudt3AAscYrWyYk4x9J6BbrQTZCzYY4twUo
         7qR+B4bV3zjNjnrlBkP3UGrd2es+0TO9aGCzrsjmgiEj2I7ryyCm2JktzV4zAhwH5Ql9
         JjOB70zbfsfj+OHZW8l9QfK0N83tAw4f0aLJIlqAQScJR6IgMPpqyTQBGly3CgK3PuBo
         87NQ==
X-Gm-Message-State: AOJu0YwUSqhFs+lR/D7xkLPvYFxJYEzMIb/R/0hZMJRsrtz63YYjWlQd
	O9vrL3o/TrzzB1UZwUZGrI/dyfbc2uUtIjET61pBSzow72PqZjlxANEZuqERYhK9rTgef4c0aMJ
	Ka61xT8+AUPmTRKrzbjziRNQoPitvmCx9qIktHg==
X-Google-Smtp-Source: AGHT+IGL9tPTWd9wrwa+I5ZrZrqMdAWKjXIfRi9pvfQO+CEmlekEQm7BELQyY3WXwQJZeTWYneyVZFxVJrnaon6kjik=
X-Received: by 2002:a50:d791:0:b0:57c:9d54:67db with SMTP id
 4fb4d7f45d1cf-57d4bd531a1mr6158748a12.9.1719392985883; Wed, 26 Jun 2024
 02:09:45 -0700 (PDT)
MIME-Version: 1.0
From: Paraskevas Nik <parisnikf@gmail.com>
Date: Wed, 26 Jun 2024 10:09:34 +0100
Message-ID: <CAPPt5JbFkMxO5aSE2C2LhhOY7oaO=dwydYMDrMsoMo-+mvNrkQ@mail.gmail.com>
Subject: Aspeed XDMA Controller and KVM
To: linux-aspeed@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="000000000000274228061bc76024"
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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

--000000000000274228061bc76024
Content-Type: multipart/alternative; boundary="000000000000274224061bc76022"

--000000000000274224061bc76022
Content-Type: text/plain; charset="UTF-8"

Hello,
I have enabled XDMA Controller on Aspeed AST2600 and I have also reserved a
memory region.The driver comes up as expected and DMA operations work.But
KVM becomes completely unresponsive and not working.Also the Aspeed VGA PCI
Device has Unassigned Class as it can be seen from the lspci output in the
file attached.

My question is if it is possible for the XDMA to work alongside with the
KVM.
KVM stops working only after I have enabled XDMA and restart the
HOST.Please have in mind that the XDMA reserved region does not overlap
KVM's (Video memory region).

Thanks

--000000000000274224061bc76022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<br>I have enabled XDMA Controller on Aspeed A=
ST2600 and I have also reserved a memory region.The driver comes up as expe=
cted and DMA operations work.But KVM becomes completely unresponsive and no=
t working.Also the Aspeed VGA PCI Device has Unassigned Class as it can be =
seen from the lspci output in the file attached.<br><br>My question is if i=
t is possible for the XDMA to work alongside with the KVM.<br>KVM stops wor=
king only after I have enabled XDMA and restart the HOST.Please have in min=
d that the XDMA reserved region does not overlap KVM&#39;s (Video memory re=
gion).<br><br>Thanks<br></div>

--000000000000274224061bc76022--

--000000000000274228061bc76024
Content-Type: text/plain; charset="US-ASCII"; name="lspci_output.txt"
Content-Disposition: attachment; filename="lspci_output.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lxvm6iko0>
X-Attachment-Id: f_lxvm6iko0

MDM6MDEuMCBVbmFzc2lnbmVkIGNsYXNzIFtmZjAwXTogQVNQRUVEIFRlY2hub2xvZ3ksIEluYy4g
RGV2aWNlIDI0MDIgKHJldiAwMSkKICAgICAgICBTdWJzeXN0ZW06IEFTUEVFRCBUZWNobm9sb2d5
LCBJbmMuIERldmljZSAyNDAyCiAgICAgICAgQ29udHJvbDogSS9PLSBNZW0tIEJ1c01hc3Rlci0g
U3BlY0N5Y2xlLSBNZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFz
dEIyQi0gRGlzSU5UeC0KICAgICAgICBTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0g
UGFyRXJyLSBERVZTRUw9bWVkaXVtID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8
UEVSUi0gSU5UeC0KICAgICAgICBJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0byBJUlEgMjU1CiAg
ICAgICAgUmVnaW9uIDA6IE1lbW9yeSBhdCA0MjQ0MDAwMCAoMzItYml0LCBub24tcHJlZmV0Y2hh
YmxlKSBbZGlzYWJsZWRdIFtzaXplPTRLXQogICAgICAgIFJlZ2lvbiAxOiBNZW1vcnkgYXQgNDI0
MDAwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW2Rpc2FibGVkXSBbc2l6ZT0yNTZLXQog
ICAgICAgIENhcGFiaWxpdGllczogWzQwXSBQb3dlciBNYW5hZ2VtZW50IHZlcnNpb24gMwogICAg
ICAgICAgICAgICAgRmxhZ3M6IFBNRUNsay0gRFNJLSBEMSsgRDIrIEF1eEN1cnJlbnQ9Mzc1bUEg
UE1FKEQwKyxEMSssRDIrLEQzaG90KyxEM2NvbGQrKQogICAgICAgICAgICAgICAgU3RhdHVzOiBE
MCBOb1NvZnRSc3QtIFBNRS1FbmFibGUtIERTZWw9MCBEU2NhbGU9MCBQTUUtCiAgICAgICAgQ2Fw
YWJpbGl0aWVzOiBbNTBdIE1TSTogRW5hYmxlLSBDb3VudD0xLzEgTWFza2FibGUtIDY0Yml0Kwog
ICAgICAgICAgICAgICAgQWRkcmVzczogMDAwMDAwMDAwMDAwMDAwMCAgRGF0YTogMDAwMAo=
--000000000000274228061bc76024--
